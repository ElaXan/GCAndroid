import { ListrEnquirerPromptAdapter } from '@listr2/prompt-adapter-enquirer'
import { Listr, PRESET_TIMER } from 'listr2'
import { shell, Download, Files, Config, isCommandAvailable, JSONUtility } from '../Utils'
import fs from 'fs';

interface Platform {
    ID: string;
    VERSION_ID: string
}

const platform = (): Platform | undefined => {
    try {
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

export default async function install() {
    if (!fs.existsSync(Config.tmp)) {
        fs.mkdirSync(Config.tmp, { recursive: true })
    }
    try {
        await new Listr(
            [
                {
                    title: 'Getting you on-board.',
                    rendererOptions: {
                        timer: undefined
                    },
                    task: async (ctx, task) => {
                        const checkMongoDB = await isCommandAvailable('mongod')
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

                },
                {
                    title: 'Checking installation',
                    skip: (): boolean => process.platform === 'win32',
                    rendererOptions: {
                        persistentOutput: true
                    },
                    task: async (_, task) =>
                        task.newListr([
                            {
                                title: 'Update packages',
                                task: async (_, task) => {
                                    return new Promise<void>(async (resolve, reject) => {
                                        const command = process.platform === 'android' ? 'pkg up -y' : 'sudo apt-get update';
                                        await shell(command, 0, (data) => {
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
                                title: 'Install packages',
                                skip: (): boolean => process.platform === 'win32',
                                task: async (ctx, task) => {
                                    const listPackages: string[] = []
                                    let command = process.platform === 'android' ? 'pkg install' : 'sudo apt-get install'
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
                                        for (var i = 0; i < listPackages.length; i++) {
                                            if (!ctx.mongodb && listPackages[i] === 'tur-repo' || listPackages[i] === 'mongodb') continue
                                            task.title = `Installing ${listPackages[i]}`
                                            await shell(`${command} ${listPackages[i]} -y`, 0, (data) => {
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
                            },
                            {
                                title: 'Installing MongoDB (Linux)',
                                skip: (ctx): boolean => process.platform !== 'linux' || ctx.mongodb === 'false',
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
                                                    shell(`sudo apt-get install gnupg curl -y`, 0, (data) => {
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
                                                    let getData = ''
                                                    shell(`curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
                                                    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
                                                    --dearmor`, 0, (data) => {
                                                        if (data !== null) {
                                                            getData += data
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
                                                    const platformLinux = platform();
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
                                                    } else if (`${platform()?.ID}` === 'debian') {
                                                        mongodbRepo = 'echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list'
                                                    } else {
                                                        throw new Error(`Not support platform ${platform()?.ID || 'unknown'}`)
                                                    }
                                                    try {
                                                        shell(mongodbRepo, 0, (data) => {
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
                                                    shell('sudo apt-get update', 0, (data) => {
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
                                                    shell('sudo apt-get install -y mongodb-org', 0, (data) => {
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
                                                    shell(`echo "mongodb-org hold" | sudo dpkg --set-selections
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
                                        }
                                    ], {
                                        concurrent: false,
                                    })
                            }
                        ], {
                            exitOnError: true,
                        })

                },
                {
                    title: 'Doing installation.',
                    skip: (ctx): boolean => !ctx.install,
                    task: (_, task): Listr =>
                        task.newListr(
                            [
                                {
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
                                            await shell(`git clone https://github.com/Grasscutters/Grasscutter.git ${Config.defaultGrasscutterPath}`, 0, (data) => {
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
                                },
                                {
                                    title: 'Download resources',
                                    skip: (ctx): boolean => !ctx.resources,
                                    task: async (_, task) =>
                                        task.newListr([
                                            {
                                                title: 'Downloading resources',
                                                rendererOptions: {
                                                    persistentOutput: true
                                                },
                                                task: async (_, task) => {
                                                    if (fs.existsSync(`${Config.tmp}/Resources.zip`)) {
                                                        task.skip(`Resources.zip already exist`)
                                                        return
                                                    }
                                                    const downloadTask = new Download('https://gitlab.com/YuukiPS/GC-Resources/-/archive/4.0/GC-Resources-4.0.zip', `${Config.tmp}/Resources.zip`)
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
                                            },
                                            {
                                                title: 'Extracting resources',
                                                skip: (ctx): boolean => !ctx.extract || fs.existsSync(Config.defaultGrasscutterPath + '/resources'),
                                                rendererOptions: {
                                                    timer: PRESET_TIMER
                                                },
                                                exitOnError: true,
                                                task: async (_, task) => {
                                                    process.chdir(`${Config.tmp}`)
                                                    return new Promise<void>(async (resolve, reject) => {
                                                        await shell('unzip -o ./Resources.zip -d ./ExtractResources', 0, (data) => {
                                                            const split = data.split(/\n/g);
                                                            task.output = `${split[split.length - 1]}`
                                                        }).then(() => {
                                                            resolve()
                                                        }).catch((err) => {
                                                            reject(err)
                                                        })
                                                    })
                                                }
                                            }
                                        ], {
                                            rendererOptions: {
                                                clearOutput: false,
                                                collapseSubtasks: false
                                            },
                                            concurrent: false,
                                        })
                                }
                            ],
                            { concurrent: true, rendererOptions: { timer: PRESET_TIMER } }
                        )
                },
                {
                    title: 'Compiling',
                    skip: (ctx): boolean => !ctx.compileGradlew && ctx.failedClone,
                    rendererOptions: {
                        bottomBar: true,
                        outputBar: 5
                    },
                    task: async (_, task) => {
                        return new Promise<void>(async (resolve, reject) => {
                            process.chdir(`${Config.defaultGrasscutterPath}`)
                            await shell('./gradlew jar', 0, (data) => {
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
                    title: 'Configuration',
                    skip: (ctx): boolean => !ctx.compileGradlew || ctx.failedClone,
                    exitOnError: false,
                    task: (_, task) =>
                        task.newListr([
                            {
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
                            },
                            {
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
                            },
                            {
                                title: 'Change port to 54321 (Android)',
                                skip: (): boolean => process.platform !== 'android',
                                task: (_, task) =>
                                    task.newListr([
                                        {
                                            title: 'Generate config.json',
                                            skip: (): boolean => !fs.existsSync(Config.defaultGrasscutterPath + '/config.json'),
                                            task: () => {
                                                process.chdir(Config.defaultGrasscutterPath)
                                                return new Promise<void>((resolve, reject) => {
                                                    shell('timeout --foreground 7s java -jar grasscutter.jar', 124, () => {
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
                        ], {
                            concurrent: false,
                            rendererOptions: {
                                clearOutput: false,
                                collapseSubtasks: false
                            }
                        })
                },
                {
                    title: 'Cleanup',
                    skip: (ctx): boolean => !ctx.compileGradlew && ctx.failedClone,
                    task: async (_, task) =>
                        task.newListr([
                            {
                                title: 'Remove Resources.zip',
                                task: async (_, task) => {
                                    return new Promise<void>(async (resolve, reject) => {
                                        try {
                                            const resourcesPath = Config.tmp + '/Resources.zip'
                                            if (!fs.existsSync(resourcesPath)) {
                                                task.skip(`Remove Resources.zip: ${resourcesPath} not found, skip...`)
                                                resolve()
                                                return
                                            }
                                            await Files.remove(resourcesPath)
                                            resolve()
                                        } catch (error) {
                                            reject(error)
                                        }
                                    })
                                }
                            },
                            {
                                title: 'Remove ExtractResources directory',
                                task: async (_, task) => {
                                    return new Promise<void>(async (resolve, reject) => {
                                        try {
                                            const extractResourcesPath = Config.tmp + '/ExtractResources'
                                            if (!fs.existsSync(extractResourcesPath)) {
                                                task.skip(`Remove ExtractResources directory: ${extractResourcesPath} not found. Skip`)
                                                resolve()
                                                return
                                            }
                                            task.output = 'Removing ExtractResources'
                                            await Files.remove(`${Config.tmp}/ExtractResources`)
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
            ],
            {
                renderer: 'default',
                rendererOptions: {
                    timer: PRESET_TIMER
                }
            }
        ).run()
    } catch (e: any) {
        console.error(e)
    }
}
