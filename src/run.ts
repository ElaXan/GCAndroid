import { spawn } from "child_process";
import { Config, isCommandAvailable, JSONUtility, shell } from './Utils'
import fs from 'fs';
import path from 'path'
import { Database as MongoDB } from "./Utils";
import { ServerApiVersion } from "mongodb";
import { Logger } from "./Utils";

export default async function (pathExecuteJar?: string, port?: number, mongodb?: boolean, skipCheckMongodb?: boolean) {
    let pathJar
    if (pathExecuteJar) {
        pathJar = pathExecuteJar
    } else {
        pathJar = `${Config.defaultGrasscutterPath}/grasscutter.jar`
    }

    if (port && typeof port !== 'number') {
        throw new Error('Port must be a number.')
    }

    if (!fs.existsSync(pathJar)) {
        throw new Error(`${pathJar} does not exist.`)
    }

    Logger.info('Path jar:', pathJar);

    Logger.info('Checking if java command is available')
    const checkJavaCommand = await isCommandAvailable('java')
    if (!checkJavaCommand) {
        throw new Error('Java command is not found. Is java installed?')
    }

    if (mongodb) {
        const checkMongoDBCommand = await isCommandAvailable('mongod')
        if (!checkMongoDBCommand) {
            throw new Error('MongoDB command is not found. Is mongodb-server installed?.')
        }
        Logger.info('Running mongodb')
        shell('mongod > /dev/null 2>&1 &', 0, () => {})
    }

    Logger.info('Changing directory to', path.dirname(pathJar));
    process.chdir(path.dirname(pathJar));
    const pathConfigJson = './config.json';
    const jsonUtility = new JSONUtility({ keyPath: 'server.http.bindPort', path: './config.json' })

    const checkMongoDBConnection = async (uriKeyPath: string, dbNameKeyPath: string) => {
        const uri = new JSONUtility({ keyPath: uriKeyPath, path: pathConfigJson }).read()
        const dbName = new JSONUtility({ keyPath: dbNameKeyPath, path: pathConfigJson }).read()

        Logger.info(`Checking if the database is running for collection ${dbName} and uri ${uri}`)

        try {
            await new MongoDB({ uri, dbName }).connect({
                serverApi: ServerApiVersion.v1,
            })
            Logger.info('Database is running')
        } catch (error) {
            Logger.error('MongoDB is not running. Try `-d` to run mongodb')
            throw error;
        }
    }

    if (fs.existsSync(path.join(Config.defaultGrasscutterPath, '/config.json'))) {
        Logger.info('Path config.json: ' + path.join(Config.defaultGrasscutterPath, 'config.json'))
        Logger.info('Port:', jsonUtility.read())
        if (port) {
            Logger.info(`Changing port from config.json to ${port}`)
            jsonUtility.write(port)
        }
        if (skipCheckMongodb) {
            Logger.warn('Skip check mongodb')
        } else {
            await checkMongoDBConnection('databaseInfo.server.connectionUri', 'databaseInfo.server.collection')
            await checkMongoDBConnection('databaseInfo.game.connectionUri', 'databaseInfo.game.collection')
        }
    } else {
        Logger.warn(`config.json does not exist in ${Config.defaultGrasscutterPath} directory`)
    }

    const child = spawn('java -jar grasscutter.jar', { shell: true, stdio: 'inherit' })
    child.stdout?.on('data', (chunk) => {
        console.log(chunk.toString())
    })

    child.stderr?.on('data', (chunk) => {
        console.log(chunk.toString())
    })

    child.on('exit', (code) => {
        console.log('Program exited with code ' + code)
        process.exit(code || 0)
    })
}
