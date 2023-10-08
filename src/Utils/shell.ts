import { spawn } from 'child_process'

/**
* Executes a shell command asynchronously.
*
* @param {string} command - The shell command to execute.
* @param {number} errorCode - The expected exit code of the command.
* @param {Function} onDataCallback - A callback function to handle the command output.
* @return {Promise<void>} A promise that resolves when the command completes successfully, or rejects with an error message.
*/
export async function shell(command: string, errorCode: number, onDataCallback: (data: string) => void): Promise<void> {
    let output = ''
    return new Promise<void>((resolve, reject) => {
        const cloneProcess = spawn(command, { shell: true });
        cloneProcess.stdout?.on('data', (data) => {
            output += data.toString()
            onDataCallback(data.toString());
        })

        cloneProcess.stderr?.on('data', (data) => {
            output += data.toString()
            onDataCallback(data.toString());
        })

        cloneProcess.on('close', (code) => {
            const message = 'Program exited with code'
            if (code === errorCode) {
                resolve()
            } else {
                reject(`${output}\n${message} ${code}`)
            }
        })
    })
}

export async function isCommandAvailable(command: string): Promise<boolean> {
    return new Promise<boolean>((resolve) => {
        const commandName = process.platform === 'win32' ? 'where' : 'which';
        const childProcess = spawn(commandName, [command])

        childProcess.on('exit', (code) => {
            const isAvailable = code === 0;
            resolve(isAvailable)
        })

        childProcess.on('error', () => {
            resolve(false)
        })
    })
}