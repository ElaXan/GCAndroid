#!/usr/bin/env node

import { program } from 'commander';
import Install from '../src/Grasscutters/install';
import run from '../src/Grasscutters/run'
import { handleUpdate } from '../src/Utils'
import { version } from '../package.json';

export const polycutterVersion = version

export interface InstallGrasscutter {
    repository?: string;
    resources?: string;
}

program.version(polycutterVersion);

program.command('install')
    .option('-r, --repository [url]', 'Set a custom clone repository (Default: https://github.com/Grasscutters/Grasscutter)')
    .option('-res, --resources [url]', 'Set custom resources for Grasscutters (Default: https://gitlab.com/YuukiPS/GC-Resources/-/archive/4.0/GC-Resources-4.0.zip)')
    .description('Install Grasscutter')
    .action(async (options: InstallGrasscutter) => {
        const install = new Install(options);
        try {
            await install.run();
        } catch (error) {
            console.error('Error during installation:', error);
        }
    })
    .addHelpCommand('-r', 'This option will clone the repository as you provided. Example: `polycutter install -r https://github.com/Grasscutters/Grasscutter` It will clone the repository from https://github.com/Grasscutters/Grasscutter.')
    .addHelpCommand('-res', 'This option allows you to set custom resources for Grasscutters. Example: `polycutter install -res https://example.com/custom-resources.zip` It will use the specified resources for the installation (Default: https://gitlab.com/YuukiPS/GC-Resources/-/archive/4.0/GC-Resources-4.0.zip)');

program.command('run')
    .option('-p, --port [port]', 'Change/Custom port to run Grasscutter')
    .option('--path [path]', 'Path to grasscutter.jar')
    .option('-d, --mongodb', 'Run mongodb')
    .option('-sc, --skip-check', 'Skip check mongodb is running')
    .description('Run Grasscutter')
    .action(async (str) => {
        const getPath = str.path;
        const port = parseInt(str.port);
        const mongodb: boolean = str.mongodb;
        const skipCheck: boolean = str.skipCheck;
        try {
            await run(getPath, port, mongodb, skipCheck);
        } catch (error) {
            console.error('Error during running Grasscutter:', error);
        }
    });

program.command('update')
    .description('Update Polycutter')
    .action(async () => {
        try {
            await handleUpdate({
                polycutterVersion
            });
        } catch (error) {
            console.error('Error during update:', error);
        }
    });

program.parse(process.argv);
