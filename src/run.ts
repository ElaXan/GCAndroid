import { spawn } from "child_process";
import { Config, isCommandAvailable, JSONUtility } from './Utils'
import fs from 'fs';
import path from 'path'

export default async function(pathExecuteJar?: string, port?: number) {
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


    const checkJavaCommand = await isCommandAvailable('java')
    if (!checkJavaCommand) {
        throw new Error('Java command is not found. Is java installed?')
    }

    
    process.chdir(path.dirname(pathJar));
    const jsonUtility = new JSONUtility({ keyPath: 'server.http.bindPort', path: './config.json'})

    console.log('Execute/Run grasscutter.jar')
    console.log('Path .jar: ' + pathJar)
    if (fs.existsSync(path.join(Config.defaultGrasscutterPath, '/config.json'))) {
        if (port) {
            jsonUtility.write(port)
        }
        console.log('Path config.json: ' + path.join(pathJar, 'config.json'))
        console.log('Port:', jsonUtility.read())
    }

    const child = spawn('java -jar grasscutter.jar', { shell: true, stdio: 'inherit'})
    child.stdout?.on('data', (chunk) => {
        console.log(chunk.toString())
    })

    child.stderr?.on('data', (chunk) => {
        console.log(chunk.toString())
    })

    child.on('exit', (code) => {
        console.log('Program exited with code ' + code)
    })
}
