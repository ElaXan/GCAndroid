"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const prompt_adapter_enquirer_1 = require("@listr2/prompt-adapter-enquirer");
const listr2_1 = require("listr2");
const Utils_1 = require("../Utils");
const fs_1 = __importDefault(require("fs"));
const platform = () => {
    try {
        const osReleaseContents = fs_1.default.readFileSync('/etc/os-release', 'utf-8');
        const lines = osReleaseContents.split('\n');
        let ID = '';
        let VERSION_ID = '';
        for (const line of lines) {
            const [key, values] = line.split('=');
            if (key === 'ID') {
                ID = values.replace(/"/g, '').trim();
            }
            else if (key === 'VERSION_ID') {
                VERSION_ID = values.replace(/"/g, '').trim();
            }
        }
        return {
            ID,
            VERSION_ID
        };
    }
    catch (error) {
        console.error(error);
    }
};
function install() {
    return __awaiter(this, void 0, void 0, function* () {
        if (!fs_1.default.existsSync(Utils_1.Config.tmp)) {
            fs_1.default.mkdirSync(Utils_1.Config.tmp, { recursive: true });
        }
        try {
            yield new listr2_1.Listr([
                {
                    title: 'Getting you on-board.',
                    rendererOptions: {
                        timer: undefined
                    },
                    task: (ctx, task) => __awaiter(this, void 0, void 0, function* () {
                        const checkMongoDB = yield (0, Utils_1.isCommandAvailable)('mongod');
                        if (!checkMongoDB && process.platform !== 'win32') {
                            ctx.mongodb = yield task.prompt(prompt_adapter_enquirer_1.ListrEnquirerPromptAdapter).run({
                                type: 'Toggle',
                                message: 'Do you want to install MongoDB?',
                                initial: true
                            });
                        }
                        else {
                            ctx.mongodb = 'false';
                        }
                        if (!fs_1.default.existsSync(Utils_1.Config.defaultGrasscutterPath + '/resources')) {
                            ctx.resources = yield task.prompt(prompt_adapter_enquirer_1.ListrEnquirerPromptAdapter).run({
                                type: 'Toggle',
                                message: 'Do you want to install resources?',
                                initial: true
                            });
                        }
                        if (ctx.resources) {
                            ctx.extract = yield task.prompt(prompt_adapter_enquirer_1.ListrEnquirerPromptAdapter).run({
                                type: 'Toggle',
                                message: 'Do you want to extract resources?',
                                initial: true
                            });
                        }
                        ctx.compileGradlew = yield task.prompt(prompt_adapter_enquirer_1.ListrEnquirerPromptAdapter).run({
                            type: 'Toggle',
                            message: 'Do you want to compile Grasscutter to jar?',
                            initial: true
                        });
                        ctx.install = true;
                    }),
                },
                {
                    title: 'Checking installation',
                    skip: () => process.platform === 'win32',
                    rendererOptions: {
                        persistentOutput: true
                    },
                    task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                        return task.newListr([
                            {
                                title: 'Update packages',
                                task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                    return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                        const command = process.platform === 'android' ? 'pkg up -y' : 'sudo apt-get update';
                                        yield (0, Utils_1.shell)(command, 0, (data) => {
                                            if (data !== null) {
                                                task.output = `${data}`;
                                            }
                                        }).then(() => {
                                            resolve();
                                        }).catch((err) => {
                                            reject(err);
                                        });
                                    }));
                                })
                            },
                            {
                                title: 'Install packages',
                                skip: () => process.platform === 'win32',
                                task: (ctx, task) => __awaiter(this, void 0, void 0, function* () {
                                    const listPackages = [];
                                    let command = process.platform === 'android' ? 'pkg install' : 'sudo apt-get install';
                                    if (process.platform === 'linux') {
                                        listPackages.push('git', 'openjdk-17-jdk', 'unzip');
                                    }
                                    else {
                                        listPackages.push('git', 'openjdk-17', 'unzip', 'tur-repo', 'mongodb');
                                    }
                                    return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                        for (var i = 0; i < listPackages.length; i++) {
                                            if (!ctx.mongodb && listPackages[i] === 'tur-repo' || listPackages[i] === 'mongodb')
                                                continue;
                                            task.title = `Installing ${listPackages[i]}`;
                                            yield (0, Utils_1.shell)(`${command} ${listPackages[i]} -y`, 0, (data) => {
                                                if (data !== null) {
                                                    task.output = `${data}`;
                                                }
                                            }).catch((err) => {
                                                reject(err);
                                            });
                                        }
                                        resolve();
                                    }));
                                })
                            },
                            {
                                title: 'Installing MongoDB (Linux)',
                                skip: (ctx) => process.platform !== 'linux' || ctx.mongodb === 'false',
                                exitOnError: true,
                                rendererOptions: {
                                    persistentOutput: true
                                },
                                task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                    return task.newListr([
                                        {
                                            title: 'Installing Required Dependencies for MongoDB Server Installation',
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => {
                                                    (0, Utils_1.shell)(`sudo apt-get install gnupg curl -y`, 0, (data) => {
                                                        if (data !== null) {
                                                            task.output = `${data}`;
                                                        }
                                                    }).then(() => {
                                                        resolve();
                                                    }).catch((err) => {
                                                        reject(err);
                                                    });
                                                });
                                            })
                                        },
                                        {
                                            title: 'Importing MongoDB Server 7.0 GPG Key for Secure Installation',
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => {
                                                    let getData = '';
                                                    (0, Utils_1.shell)(`curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
                                                    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
                                                    --dearmor`, 0, (data) => {
                                                        if (data !== null) {
                                                            getData += data;
                                                            task.output = `${data}`;
                                                        }
                                                    }).then(() => {
                                                        resolve();
                                                    }).catch((err) => {
                                                        reject(err);
                                                    });
                                                });
                                            })
                                        },
                                        {
                                            title: 'Adding MongoDB Server 7.0 Repository to Your Package Sources',
                                            exitOnError: true,
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                                    var _a, _b;
                                                    const platformLinux = platform();
                                                    if (!platformLinux) {
                                                        reject('Unsupported platform');
                                                        return;
                                                    }
                                                    const platformID = platformLinux.ID;
                                                    const platformVersion = platformLinux.VERSION_ID;
                                                    let choices = null;
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
                                                        mongodbRepo = 'echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list';
                                                    }
                                                    else if (choices === 'Ubuntu 20.04 (Focal)') {
                                                        mongodbRepo = 'echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list';
                                                    }
                                                    else if (`${(_a = platform()) === null || _a === void 0 ? void 0 : _a.ID}` === 'debian') {
                                                        mongodbRepo = 'echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list';
                                                    }
                                                    else {
                                                        throw new Error(`Not support platform ${((_b = platform()) === null || _b === void 0 ? void 0 : _b.ID) || 'unknown'}`);
                                                    }
                                                    try {
                                                        (0, Utils_1.shell)(mongodbRepo, 0, (data) => {
                                                            if (data !== null) {
                                                                task.output = `${data}`;
                                                            }
                                                        }).then(() => {
                                                            resolve();
                                                        }).catch((error) => {
                                                            reject(error);
                                                        });
                                                    }
                                                    catch (error) {
                                                        reject(error);
                                                    }
                                                }));
                                            }),
                                        },
                                        {
                                            title: 'Refreshing Package Repositories for MongoDB Server Installation',
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => {
                                                    (0, Utils_1.shell)('sudo apt-get update', 0, (data) => {
                                                        if (data !== null) {
                                                            task.output = `${data}`;
                                                        }
                                                    }).then(() => {
                                                        resolve();
                                                    }).catch((err) => {
                                                        reject(err);
                                                    });
                                                });
                                            })
                                        },
                                        {
                                            title: 'Installing MongoDB Server 7.0',
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => {
                                                    (0, Utils_1.shell)('sudo apt-get install -y mongodb-org', 0, (data) => {
                                                        if (data !== null) {
                                                            task.output = `${data}`;
                                                        }
                                                    }).then(() => {
                                                        resolve();
                                                    }).catch((err) => {
                                                        reject(err);
                                                    });
                                                });
                                            })
                                        },
                                        {
                                            title: 'Setting MongoDB Server 7.0 Packages on Hold',
                                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                                return new Promise((resolve, reject) => {
                                                    (0, Utils_1.shell)(`echo "mongodb-org hold" | sudo dpkg --set-selections
                                                    echo "mongodb-org-database hold" | sudo dpkg --set-selections
                                                    echo "mongodb-org-server hold" | sudo dpkg --set-selections
                                                    echo "mongodb-mongosh hold" | sudo dpkg --set-selections
                                                    echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
                                                    echo "mongodb-org-tools hold" | sudo dpkg --set-selections`, 0, (data) => {
                                                        if (data !== null) {
                                                            task.output = `${data}`;
                                                        }
                                                    }).then(() => {
                                                        resolve();
                                                    }).catch((err) => {
                                                        reject(err);
                                                    });
                                                });
                                            })
                                        }
                                    ], {
                                        concurrent: false,
                                    });
                                })
                            }
                        ], {
                            exitOnError: true,
                        });
                    })
                },
                {
                    title: 'Doing installation.',
                    skip: (ctx) => !ctx.install,
                    task: (_, task) => task.newListr([
                        {
                            title: 'Cloning Grasscutter',
                            rendererOptions: {
                                persistentOutput: true
                            },
                            exitOnError: false,
                            skip: (ctx) => !ctx.install,
                            task: (ctx, task) => __awaiter(this, void 0, void 0, function* () {
                                if (fs_1.default.existsSync(Utils_1.Config.defaultGrasscutterPath)) {
                                    task.skip('Clone: Folder Grasscutter already exist');
                                    return;
                                }
                                return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                    yield (0, Utils_1.shell)(`git clone https://github.com/Grasscutters/Grasscutter.git ${Utils_1.Config.defaultGrasscutterPath}`, 0, (data) => {
                                        if (data !== null) {
                                            task.output = `${data}`;
                                        }
                                    }).then((message) => {
                                        ctx.failedClone = false;
                                        resolve(`${message}`);
                                    }).catch((err) => {
                                        ctx.failedClone = true;
                                        reject(err);
                                    });
                                }));
                            })
                        },
                        {
                            title: 'Download resources',
                            skip: (ctx) => !ctx.resources,
                            task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                return task.newListr([
                                    {
                                        title: 'Downloading resources',
                                        rendererOptions: {
                                            persistentOutput: true
                                        },
                                        task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                            if (fs_1.default.existsSync(`${Utils_1.Config.tmp}/Resources.zip`)) {
                                                task.skip(`Resources.zip already exist`);
                                                return;
                                            }
                                            const downloadTask = new Utils_1.Download('https://gitlab.com/YuukiPS/GC-Resources/-/archive/4.0/GC-Resources-4.0.zip', `${Utils_1.Config.tmp}/Resources.zip`);
                                            return new Promise((resolve, reject) => {
                                                downloadTask.execute((progress, eta) => {
                                                    task.output = `Progress: ${progress.toFixed(2)}% | ETA: ${eta}`;
                                                }).then(() => {
                                                    resolve();
                                                }).catch((error) => {
                                                    reject(error);
                                                });
                                            });
                                        })
                                    },
                                    {
                                        title: 'Extracting resources',
                                        skip: (ctx) => !ctx.extract || fs_1.default.existsSync(Utils_1.Config.defaultGrasscutterPath + '/resources'),
                                        rendererOptions: {
                                            timer: listr2_1.PRESET_TIMER
                                        },
                                        exitOnError: true,
                                        task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                            process.chdir(`${Utils_1.Config.tmp}`);
                                            return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                                yield (0, Utils_1.shell)('unzip -o ./Resources.zip -d ./ExtractResources', 0, (data) => {
                                                    const split = data.split(/\n/g);
                                                    task.output = `${split[split.length - 1]}`;
                                                }).then(() => {
                                                    resolve();
                                                }).catch((err) => {
                                                    reject(err);
                                                });
                                            }));
                                        })
                                    }
                                ], {
                                    rendererOptions: {
                                        clearOutput: false,
                                        collapseSubtasks: false
                                    },
                                    concurrent: false,
                                });
                            })
                        }
                    ], { concurrent: true, rendererOptions: { timer: listr2_1.PRESET_TIMER } })
                },
                {
                    title: 'Compiling',
                    skip: (ctx) => !ctx.compileGradlew && ctx.failedClone,
                    rendererOptions: {
                        bottomBar: true,
                        outputBar: 5
                    },
                    task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                        return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                            process.chdir(`${Utils_1.Config.defaultGrasscutterPath}`);
                            yield (0, Utils_1.shell)('./gradlew jar', 0, (data) => {
                                if (data !== null) {
                                    task.output = `${data}`;
                                }
                            }).then(() => {
                                resolve();
                            }).catch((err) => {
                                reject(err);
                            });
                        }));
                    })
                },
                {
                    title: 'Configuration',
                    skip: (ctx) => !ctx.compileGradlew || ctx.failedClone,
                    exitOnError: false,
                    task: (_, task) => task.newListr([
                        {
                            title: 'Rename Jar',
                            task: () => __awaiter(this, void 0, void 0, function* () {
                                return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                    try {
                                        yield Utils_1.Files.rename(`${Utils_1.Config.defaultGrasscutterPath}/grasscutter-*.jar`, `${Utils_1.Config.defaultGrasscutterPath}/grasscutter.jar`);
                                        resolve();
                                    }
                                    catch (error) {
                                        reject(error);
                                    }
                                }));
                            })
                        },
                        {
                            title: 'Move Resources to Grasscutter',
                            skip: (ctx) => fs_1.default.existsSync(Utils_1.Config.defaultGrasscutterPath + '/resources') || !ctx.resources,
                            task: () => __awaiter(this, void 0, void 0, function* () {
                                return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                    try {
                                        yield Utils_1.Files.move(`${Utils_1.Config.tmp}/ExtractResources/*/Resources`, `${Utils_1.Config.defaultGrasscutterPath}/resources`);
                                        resolve();
                                    }
                                    catch (error) {
                                        reject(error);
                                    }
                                }));
                            })
                        },
                        {
                            title: 'Change port to 54321 (Android)',
                            skip: () => process.platform !== 'android',
                            task: (_, task) => task.newListr([
                                {
                                    title: 'Generate config.json',
                                    skip: () => !fs_1.default.existsSync(Utils_1.Config.defaultGrasscutterPath + '/config.json'),
                                    task: () => {
                                        process.chdir(Utils_1.Config.defaultGrasscutterPath);
                                        return new Promise((resolve, reject) => {
                                            (0, Utils_1.shell)('timeout --foreground 7s java -jar grasscutter.jar', 124, () => {
                                                // Do nothing
                                            }).then(() => {
                                                resolve();
                                            }).catch(() => {
                                                reject();
                                            });
                                        });
                                    }
                                },
                                {
                                    title: 'Editing config.json',
                                    task: () => __awaiter(this, void 0, void 0, function* () {
                                        process.chdir(Utils_1.Config.defaultGrasscutterPath);
                                        const jsonUtility = new Utils_1.JSONUtility({
                                            path: Utils_1.Config.defaultGrasscutterPath + '/config.json',
                                            keyPath: 'server.http.bindPort'
                                        });
                                        jsonUtility.write(54321);
                                    })
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
                    skip: (ctx) => !ctx.compileGradlew && ctx.failedClone,
                    task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                        return task.newListr([
                            {
                                title: 'Remove Resources.zip',
                                task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                    return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                        try {
                                            const resourcesPath = Utils_1.Config.tmp + '/Resources.zip';
                                            if (!fs_1.default.existsSync(resourcesPath)) {
                                                task.skip(`Remove Resources.zip: ${resourcesPath} not found, skip...`);
                                                resolve();
                                                return;
                                            }
                                            yield Utils_1.Files.remove(resourcesPath);
                                            resolve();
                                        }
                                        catch (error) {
                                            reject(error);
                                        }
                                    }));
                                })
                            },
                            {
                                title: 'Remove ExtractResources directory',
                                task: (_, task) => __awaiter(this, void 0, void 0, function* () {
                                    return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                                        try {
                                            const extractResourcesPath = Utils_1.Config.tmp + '/ExtractResources';
                                            if (!fs_1.default.existsSync(extractResourcesPath)) {
                                                task.skip(`Remove ExtractResources directory: ${extractResourcesPath} not found. Skip`);
                                                resolve();
                                                return;
                                            }
                                            task.output = 'Removing ExtractResources';
                                            yield Utils_1.Files.remove(`${Utils_1.Config.tmp}/ExtractResources`);
                                            resolve();
                                        }
                                        catch (error) {
                                            reject(error);
                                        }
                                    }));
                                })
                            }
                        ], {
                            concurrent: true,
                            rendererOptions: {
                                clearOutput: true
                            }
                        });
                    })
                }
            ], {
                renderer: 'default',
                rendererOptions: {
                    timer: listr2_1.PRESET_TIMER
                }
            }).run();
        }
        catch (e) {
            console.error(e);
        }
    });
}
exports.default = install;
