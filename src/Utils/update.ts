import { Listr } from "listr2";
import { ListrEnquirerPromptAdapter } from "@listr2/prompt-adapter-enquirer";
import { Shell } from "./";
import axios from 'axios';

interface PolycutterRegistry {
    _id: string;
    _rev: string;
    name: string;
    "dist-tags": DistTags;
    versions: { [key: string]: Version };
    time: { [key: string]: string };
    maintainers: Maintainer[];
    description: string;
    homepage: string;
    keywords: string[];
    repository: Repository;
    contributors: any[];
    author: Author;
    bugs: Bugs;
    license: string;
    readme: string;
    readmeFilename: string;
}

interface Author {
    name: string;
    email: string;
    url: string;
}

interface Bugs {
    url: string;
}

interface DistTags {
    latest: string;
}

interface Maintainer {
    name: string;
    email: string;
}

interface Repository {
    type: string;
    url: string;
}

interface Version {
    name: string;
    version: string;
    description: string;
    scripts: Scripts;
    main: string;
    repository: Repository;
    author: Author;
    license: string;
    private: boolean;
    bin: Bin;
    keywords: string[];
    contributors: any[];
    bugs: Bugs;
    homepage: string;
    devDependencies: DevDependencies;
    dependencies: { [key: string]: string };
    _id: string;
    _integrity: string;
    _resolved: string;
    _from: string;
    _nodeVersion: string;
    _npmVersion: string;
    dist: Dist;
    _npmUser: Maintainer;
    directories: Directories;
    maintainers: Maintainer[];
    _npmOperationalInternal: NpmOperationalInternal;
    _hasShrinkwrap: boolean;
}

interface NpmOperationalInternal {
    host: string;
    tmp: string;
}

interface Bin {
    polycutter: string;
}

interface DevDependencies {
    "@types/fs-extra": string;
    "@types/node": string;
    "@types/unzipper": string;
    typescript: string;
}

interface Directories {
}

interface Dist {
    integrity: string;
    shasum: string;
    tarball: string;
    fileCount: number;
    unpackedSize: number;
    signatures: Signature[];
}

interface Signature {
    keyid: string;
    sig: string;
}

interface Scripts {
    start: string;
    compile: string;
    prepack: string;
    build: string;
}


export default async function handleUpdate(options: { polycutterVersion: string }) {
    console.log('Checking update')
    const response: PolycutterRegistry = await axios.get('https://registry.npmjs.org/polycutter', {
        timeout: 10000
    }).then((res) => res.data).catch((err) => {
        console.error(err)
        throw err
    })

    const polycutterParts = options.polycutterVersion.split('.').map(Number);
    const latestVersion = response["dist-tags"].latest.split('.').map(Number);

    const isHigherOrEqual = polycutterParts.every((value, index) => value >= latestVersion[index])

    if (isHigherOrEqual) {
        console.log(`Looks like there is no update for Polycutter.\nCurrent Version: ${options.polycutterVersion}\nLatest version: ${response["dist-tags"].latest}`)
        return
    }

    console.log(`There is update to version ${response["dist-tags"].latest}`)

    new Listr([
        {
            title: 'Getting you on-board.',
            task: async (ctx, task) => {
                ctx.update = await task.prompt(ListrEnquirerPromptAdapter).run({
                    message: 'Do you want to update Polycutter?',
                    type: 'Confirm',
                    initial: true
                })
            }
        },
        {
            title: 'Updating Polycutter',
            skip: (ctx) => !ctx.update,
            task: async (_, task) => {
                return new Promise<void>((resolve, reject) => {
                    const command = (): string => {
                        const prefix = process.platform === 'linux' ? 'sudo ' : '';
                        return `${prefix}npm i -g polycutter`;
                    };
                    Shell.execute(command(), 0, (data) => {
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
        renderer: 'default',
        rendererOptions: {
            collapseSubtasks: false
        }
    }).run()
}