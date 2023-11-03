import { Listr, ListrTask, PRESET_TIMER } from "listr2";
import { InstallGrasscutter } from '../../bin/polycutter'
import fs from 'fs';
import { Config, Download, Files, JSONUtility, Logger, Shell } from "../Utils";
import { ListrEnquirerPromptAdapter } from "@listr2/prompt-adapter-enquirer";

interface Platform {
    ID: string;
    VERSION_ID: string
}

export default class Install {
    private cloneURL = 'https://github.com/Grasscutters/Grasscutter';
    private resourcesURL = 'https://gitlab.com/YuukiPS/GC-Resources/-/archive/4.0/GC-Resources-4.0.zip';
    constructor(options: InstallGrasscutter) {
        if (options.repository)
            this.cloneURL = options.repository;
        if (options.resources)
            this.resourcesURL = options.resources;
    }

    private taskList = new Listr([], {
        rendererOptions: {
            lazy: true,
            timer: PRESET_TIMER
        }
    })

    private gettingYouOnBoard: ListrTask = {
        title: 'Getting you on-board.',
        rendererOptions: {
            timer: undefined
        },
        task: async (ctx, task) => {
            const checkMongoDB = await Shell.checkCommand('mongod')
            if (!checkMongoDB && process.platform !== 'win32') {
                ctx.mongodb = await task.prompt(ListrEnquirerPromptAdapter).run({
                    type: 'Toggle',
                    message: 'Do you want to install MongoDB?',
                    initial: true
                })
            } else {
                ctx.mongodb = 'false'
            }
            if (!fs.existsSync(Config.defaultGrasscutterPath + '/resources')) {
                ctx.resources = await task.prompt(ListrEnquirerPromptAdapter).run({
                    type: 'Toggle',
                    message: 'Do you want to install resources?',
                    initial: true
                })
            }
            if (ctx.resources) {
                ctx.extract = await task.prompt(ListrEnquirerPromptAdapter).run({
                    type: 'Toggle',
                    message: 'Do you want to extract resources?',
                    initial: true
                })
            }
            ctx.compileGradlew = await task.prompt(ListrEnquirerPromptAdapter).run({
                type: 'Toggle',
                message: 'Do you want to compile Grasscutter to jar?',
                initial: true
            })
            ctx.install = true;
        },

    }

    private distributions(): Platform | undefined {
        try {
            if (process.platform !== 'linux') return
            const osReleaseContents = fs.readFileSync('/etc/os-release', 'utf-8');
            const lines = osReleaseContents.split('\n');

            let ID = '';
            let VERSION_ID = ''
            for (const line of lines) {
                const [key, values] = line.split('=');
                if (key === 'ID') {
                    ID = values.replace(/"/g, '').trim()
                } else if (key === 'VERSION_ID') {
                    VERSION_ID = values.replace(/"/g, '').trim()
                }
            }
            return {
                ID,
                VERSION_ID
            }
        } catch (error) {
            console.error(error)
        }
    }

    private checkInstallation = () => {
        const updatePackage: ListrTask = {
            title: 'Update packages',
            task: async (_, task) => {
                return new Promise<void>(async (resolve, reject) => {
                    const command = process.platform === 'android' ? 'pkg up -y' : 'sudo apt-get update';
                    await Shell.execute(command, 0, (data) => {
                        if (data !== null) {
                            task.output = `${data}`
                        }
                    }).then(() => {
                        resolve()
                    }).catch((err) => {
                        reject(err)
                    })
                })
            }
        }

        const installPackage: ListrTask = {
            title: 'Install packages',
            task: async (ctx, task) => {
                const listPackages: string[] = []
                const command = process.platform === 'android' ? 'pkg install' : 'sudo apt-get install'
                if (process.platform === 'linux') {
                    listPackages.push(
                        'git',
                        'openjdk-17-jdk',
                        'unzip',
                    )
                } else {
                    listPackages.push(
                        'git',
                        'openjdk-17',
                        'unzip',
                        'tur-repo',
                        'mongodb'
                    )
                }
                return new Promise<void>(async (resolve, reject) => {
                    for (let i = 0; i < listPackages.length; i++) {
                        if (!ctx.mongodb && listPackages[i] === 'tur-repo' || listPackages[i] === 'mongodb') continue
                        task.title = `Installing ${listPackages[i]}`
                        await Shell.execute(`${command} ${listPackages[i]} -y`, 0, (data) => {
                            if (data !== null) {
                                task.output = `${data}`
                            }
                        }).catch((err) => {
                            reject(err)
                        })
                    }
                    resolve()
                })
            }
        }

        const installMongodbLinux: ListrTask = {
            title: 'Installing MongoDB (Linux)',
            skip: (ctx): boolean => ctx.mongodb === 'false',
            exitOnError: true,
            rendererOptions: {
                persistentOutput: true
            },
            task: async (_, task) =>
                task.newListr([
                    {
                        title: 'Installing Required Dependencies for MongoDB Server Installation',
                        task: async (_, task) => {
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute(`sudo apt-get install gnupg curl -y`, 0, (data) => {
                                    if (data !== null) {
                                        task.output = `${data}`
                                    }
                                }).then(() => {
                                    resolve()
                                }).catch((err) => {
                                    reject(err)
                                })
                            })
                        }
                    },
                    {
                        title: 'Importing MongoDB Server 7.0 GPG Key for Secure Installation',
                        task: async (_, task) => {
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute(`curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
                                sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
                                --dearmor`, 0, (data) => {
                                    if (data !== null) {
                                        task.output = `${data}`
                                    }
                                }).then(() => {
                                    resolve()
                                }).catch((err) => {
                                    reject(err)
                                })
                            })
                        }
                    },
                    {
                        title: 'Adding MongoDB Server 7.0 Repository to Your Package Sources',
                        exitOnError: true,
                        task: async (_, task) => {
                            return new Promise<void>(async (resolve, reject) => {
                                const platformLinux = this.distributions();
                                if (!platformLinux) {
                                    reject('Unsupported platform')
                                    return
                                }
                                const platformID = platformLinux.ID;
                                const platformVersion = platformLinux.VERSION_ID;
                                let choices: string | null = null;

                                if (platformID === 'ubuntu') {
                                    switch (platformVersion) {
                                        case '20.04':
                                            choices = 'Ubuntu 20.04 (Focal)';
                                            break;
                                        case '22.04':
                                            choices = 'Ubuntu 22.04 (Jammy)';
                                            break;
                                        default:
                                            break;
                                    }
                                }

                                let mongodbRepo = '';
                                if (choices === 'Ubuntu 22.04 (Jammy)') {
                                    mongodbRepo = 'echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list'
                                } else if (choices === 'Ubuntu 20.04 (Focal)') {
                                    mongodbRepo = 'echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list'
                                } else if (`${platformLinux.ID}` === 'debian' || `${platformLinux.ID}` === 'kali') {
                                    mongodbRepo = 'echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list'
                                } else {
                                    throw new Error(`Not support platform ${platformLinux.ID || 'unknown'}`)
                                }
                                try {
                                    Shell.execute(mongodbRepo, 0, (data) => {
                                        if (data !== null) {
                                            task.output = `${data}`
                                        }
                                    }).then(() => {
                                        resolve()
                                    }).catch((error) => {
                                        reject(error)
                                    })
                                } catch (error) {
                                    reject(error)
                                }
                            })
                        },
                    },
                    {
                        title: 'Refreshing Package Repositories for MongoDB Server Installation',
                        task: async (_, task) => {
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute('sudo apt-get update', 0, (data) => {
                                    if (data !== null) {
                                        task.output = `${data}`
                                    }
                                }).then(() => {
                                    resolve()
                                }).catch((err) => {
                                    reject(err)
                                })
                            })
                        }
                    },
                    {
                        title: 'Installing MongoDB Server 7.0',
                        task: async (_, task) => {
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute('sudo apt-get install -y mongodb-org', 0, (data) => {
                                    if (data !== null) {
                                        task.output = `${data}`
                                    }
                                }).then(() => {
                                    resolve()
                                }).catch((err) => {
                                    reject(err)
                                })
                            })
                        }
                    },
                    {
                        title: 'Setting MongoDB Server 7.0 Packages on Hold',
                        task: async (_, task) => {
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute(`echo "mongodb-org hold" | sudo dpkg --set-selections
                                echo "mongodb-org-database hold" | sudo dpkg --set-selections
                                echo "mongodb-org-server hold" | sudo dpkg --set-selections
                                echo "mongodb-mongosh hold" | sudo dpkg --set-selections
                                echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
                                echo "mongodb-org-tools hold" | sudo dpkg --set-selections`, 0, (data) => {
                                    if (data !== null) {
                                        task.output = `${data}`
                                    }
                                }).then(() => {
                                    resolve()
                                }).catch((err) => {
                                    reject(err)
                                })
                            })
                        }
                    },
                    {
                        title: 'Create directory /data/db',
                        exitOnError: false,
                        task: (_, task) => {
                            try {
                                if (fs.existsSync('/data/db')) {
                                    task.skip('/data/db already exists')
                                    return
                                }
                                fs.promises.mkdir('/data/db', { recursive: true })
                                fs.promises.chmod('/data/db', 0o777)
                            } catch (error) {
                                Logger.error(error)
                            }
                        }
                    }
                ], {
                    concurrent: false,
                })
        }

        const installMongodbKali: ListrTask = {
            title: 'Install MongoDB (Kali)',
            skip: (ctx): boolean => !ctx.mongodb,
            task: (_, task) => {
                return new Promise<void>((resolve, reject) => {
                    Shell.execute('sudo apt install mongodb -y', 0, (data) => {
                        if (data) {
                            task.output = `${data}`
                        }
                    }).then(() => {
                        resolve()
                    }).catch((err) => {
                        reject(err)
                    })
                })
            }
        }

        const addToTask: ListrTask[] = [
            updatePackage,
            installPackage,
        ]

        const { platform } = process;
        const distribution = this.distributions()?.ID;

        if (platform === 'linux') {
            if (distribution === 'ubuntu' || distribution === 'debian') {
                addToTask.push(installMongodbLinux);
            } else if (distribution === 'kali') {
                addToTask.push(installMongodbKali);
            }
        }

        const main: ListrTask = {
            title: 'Checking installation',
            skip: (): boolean => process.platform === 'win32',
            rendererOptions: {
                persistentOutput: true
            },
            task: (_, task) => task.newListr(addToTask)
        }
        return main
    }

    private installation = () => {

        const cloneGrasscutter: ListrTask = {
            title: 'Cloning Grasscutter',
            rendererOptions: {
                persistentOutput: true
            },
            exitOnError: false,
            skip: (ctx): boolean => !ctx.install,
            task: async (ctx, task) => {
                if (fs.existsSync(Config.defaultGrasscutterPath)) {
                    task.skip('Clone: Folder Grasscutter already exist')
                    return
                }
                return new Promise<string>(async (resolve, reject) => {
                    await Shell.execute(`git clone ${this.cloneURL} ${Config.defaultGrasscutterPath}`, 0, (data) => {
                        if (data !== null) {
                            task.output = `${data}`
                        }
                    }).then((message) => {
                        ctx.failedClone = false
                        resolve(`${message}`)
                    }).catch((err) => {
                        ctx.failedClone = true
                        reject(err)
                    })
                })
            }
        }


        const downloadResources: ListrTask = {
            title: 'Downloading resources',
            rendererOptions: {
                persistentOutput: true
            },
            task: async (_, task) => {
                if (fs.existsSync(`${Config.tmp}/Resources.zip`)) {
                    task.skip(`Resources.zip already exist`)
                    return
                }
                const downloadTask = new Download(this.resourcesURL, `${Config.tmp}/Resources.zip`)
                return new Promise<void>((resolve, reject) => {
                    downloadTask.execute((progress, eta) => {
                        task.output = `Progress: ${progress.toFixed(2)}% | ETA: ${eta}`;
                    }).then(() => {
                        resolve()
                    }).catch((error) => {
                        reject(error)
                    })
                })
            }
        }

        const extractResources: ListrTask = {
            title: 'Extracting resources',
            skip: (ctx): boolean => !ctx.extract || fs.existsSync(Config.defaultGrasscutterPath + '/resources'),
            rendererOptions: {
                timer: PRESET_TIMER
            },
            exitOnError: true,
            task: async (_, task) => {
                process.chdir(`${Config.tmp}`)
                let startTime = Date.now();
                const updateInterval = 100;
                return new Promise<void>(async (resolve, reject) => {
                    await Shell.execute('unzip -o ./Resources.zip -d ./ExtractResources', 0, (data) => {
                        const currentTime = Date.now();
                        const elapsedTime = currentTime - startTime;
                        if (elapsedTime >= updateInterval) {
                            const split = data.split(/\n/g);
                            task.output = `${split[split.length - 1]}`
                            startTime = currentTime
                        }
                    }).then(() => {
                        resolve()
                    }).catch((err) => {
                        reject(err)
                    })
                })
            }
        }

        const resources: ListrTask = {
            title: 'Doing installation.',
            skip: (ctx): boolean => !ctx.install,
            task: (_, task): Listr =>
                task.newListr([downloadResources, extractResources], { concurrent: false })
        }

        const doTask: ListrTask[] = [
            cloneGrasscutter,
            resources
        ]

        const main: ListrTask = {
            title: 'Doing installation.',
            skip: (ctx): boolean => !ctx.install,
            task: (_, task) => task.newListr(doTask, { concurrent: true, rendererOptions: { timer: PRESET_TIMER } })
        }
        return main
    }

    private compileJar: ListrTask = {
        title: 'Compiling',
        skip: (ctx): boolean => !ctx.compileGradlew && ctx.failedClone,
        rendererOptions: {
            bottomBar: true,
            outputBar: 5
        },
        task: async (_, task) => {
            return new Promise<void>(async (resolve, reject) => {
                process.chdir(`${Config.defaultGrasscutterPath}`)
                await Shell.execute('./gradlew jar', 0, (data) => {
                    if (data !== null) {
                        task.output = `${data}`
                    }
                }).then(() => {
                    resolve()
                }).catch((err) => {
                    reject(err)
                })
            })
        }
    }

    private configuration = (): ListrTask => {

        const renameJar: ListrTask = {
            title: 'Rename Jar',
            task: async () => {
                return new Promise<void>(async (resolve, reject) => {
                    try {
                        await Files.rename(`${Config.defaultGrasscutterPath}/grasscutter-*.jar`, `${Config.defaultGrasscutterPath}/grasscutter.jar`)
                        resolve()
                    } catch (error) {
                        reject(error)
                    }
                })
            }
        }

        const moveResources: ListrTask = {
            title: 'Move Resources to Grasscutter',
            skip: (ctx): boolean => fs.existsSync(Config.defaultGrasscutterPath + '/resources') || !ctx.resources,
            task: async () => {
                return new Promise<void>(async (resolve, reject) => {
                    try {
                        await Files.move(`${Config.tmp}/ExtractResources/*/Resources`, `${Config.defaultGrasscutterPath}/resources`)
                        resolve()
                    } catch (error) {
                        reject(error)
                    }
                })
            }
        }

        const changePortAndroid: ListrTask = {
            title: 'Change port to 54321',
            skip: (): boolean => process.platform !== 'android',
            task: (_, task) =>
                task.newListr([
                    {
                        title: 'Generate config.json',
                        skip: (): boolean => !fs.existsSync(Config.defaultGrasscutterPath + '/config.json'),
                        task: () => {
                            process.chdir(Config.defaultGrasscutterPath)
                            return new Promise<void>((resolve, reject) => {
                                Shell.execute('timeout --foreground 7s java -jar grasscutter.jar', 124, () => {
                                    // Do nothing
                                }).then(() => {
                                    resolve()
                                }).catch(() => {
                                    reject()
                                })
                            })
                        }
                    },
                    {
                        title: 'Editing config.json',
                        task: async () => {
                            process.chdir(Config.defaultGrasscutterPath)
                            const jsonUtility = new JSONUtility({
                                path: Config.defaultGrasscutterPath + '/config.json',
                                keyPath: 'server.http.bindPort'
                            })
                            jsonUtility.write(54321)
                        }
                    }
                ], {
                    concurrent: false
                })
        }

        const doTask: ListrTask[] = [
            renameJar,
            moveResources
        ]

        if (process.platform === 'android')
            doTask.push(changePortAndroid)

        const main: ListrTask = {
            title: 'Configuration',
            skip: (ctx): boolean => !ctx.compileGradlew || ctx.failedClone,
            exitOnError: false,
            task: (_, task) =>
                task.newListr(doTask, {
                    concurrent: false,
                    rendererOptions: {
                        clearOutput: false,
                        collapseSubtasks: false
                    }
                })
        }
        return main
    }

    private cleanUp: ListrTask = {
        title: 'Cleanup',
        skip: (ctx): boolean => !ctx.compileGradlew && ctx.failedClone,
        task: async (_, task) =>
            task.newListr([
                {
                    title: 'Remove ' + Config.tmp,
                    task: async (_, task) => {
                        return new Promise<void>(async (resolve, reject) => {
                            try {
                                if (!fs.existsSync(Config.tmp)) {
                                    task.skip('Folder ' + Config.tmp + ' does not exist')
                                } else {
                                    Files.remove(Config.tmp)
                                }
                                resolve()
                            } catch (error) {
                                reject(error)
                            }
                        })
                    }
                }
            ], {
                concurrent: true,
                rendererOptions: {
                    clearOutput: true
                }
            })
    }

    public async run() {
        if (process.platform === 'win32' && !(await Shell.checkCommand('busybox'))) {
            throw new Error('busybox not found. Please install busybox and try again.')
        }

        fs.mkdirSync(Config.tmp, { recursive: true })

        this.taskList.add(this.gettingYouOnBoard)
        if (process.platform === 'linux' || process.platform === 'android') {
            this.taskList.add(this.checkInstallation())
        }
        this.taskList.add(this.installation())
        this.taskList.add(this.compileJar)
        this.taskList.add(this.configuration())
        this.taskList.add(this.cleanUp)

        // Run list of tasks
        await this.taskList.run()
    }
}