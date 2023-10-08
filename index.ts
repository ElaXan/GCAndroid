import { program } from 'commander';
import install from './src/Install/grasscutter';
import run from './src/run'
import { handleUpdate } from './src/Utils'
import axios from 'axios';

export const gcandroidVersion = '3.7.0'

export interface APIResponse {
    version: string
    description: string;
    changelog: string[]
}

(async () => {

})()

program.version(gcandroidVersion);

program.command('install')
    .description('Install Grasscutter')
    .action(async () => {
        await install()
    })

program.command('run')
    .option('-p, --port <port>', 'Change/Custom port to run Grasscutter')
    .option('--path <path>', 'Path to grasscutter.jar')
    .description('Run Grasscutter')
    .action(async (str) => {
        const getPath = str.path;
        const port = parseInt(str.port)
        await run(getPath, port)
    })

program.command('update')
    .description('Update GCAndroid')
    .action(async () => {
        const checkUpdate = 'https://gcandroid.elaxan.com/api/version'
        const response: APIResponse[] = await axios.post(checkUpdate, {}, {
            timeout: 10000
        }).then((res) => res.data)
        const newVersion = response[0];
        if (parseInt(newVersion.version) > parseInt(gcandroidVersion)) {
            console.log('Update available')
        }
        await handleUpdate(newVersion);
    })

program.parse(process.argv)
