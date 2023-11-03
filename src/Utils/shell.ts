import { spawn } from 'child_process'
import Logger from './log';

class Shell {
    /**
     * Executes a shell command asynchronously. Default exit code is 0.
     * @param {string} command - The shell command to execute.
     * @return {Promise<string>} A promise that resolves when the command completes successfully, or rejects with an error message.
     */
    public static async execute(command: string): Promise<string>;
    /**
     * Executes a shell command asynchronously.
     * @param {string} command - The shell command to execute.
     * @param {number} exitCode - The expected exit code of the command.
     * @return {Promise<string>} A promise that resolves when the command completes successfully, or rejects with an error message.
     */
    public static async execute(command: string, exitCode: number): Promise<string>;
    /**
    * Executes a shell command asynchronously.
    *
    * @param {string} command - The shell command to execute.
    * @param {number} errorCode - The expected exit code of the command.
    * @param {Function} onDataCallback - A callback function to handle the command output.
    * @return {Promise<void>} A promise that resolves when the command completes successfully, or rejects with an error message.
    */
    public static async execute(command: string, exitCode: number, onDataCallback: (data: string) => void): Promise<string>;

    public static async execute(command: string, exitCode?: number | undefined, onDataCallback?: (data: string) => void): Promise<string | void> {
        let output = '';
        return new Promise<string | void>((resolve, reject) => {
            const child = spawn(command, { shell: true });
            child.stdout.on('data', (data) => {
                output += data.toString();
                if (onDataCallback) {
                    onDataCallback(data.toString());
                }
            })

            child.stderr.on('data', (data) => {
                output += data.toString();
                if (onDataCallback) {
                    onDataCallback(data.toString());
                }
            })

            child.on('close', (code) => {
                const message = 'Program exited with code'
                const exit = exitCode || 0;
                if (code === exit) {
                    if (!onDataCallback) {
                        resolve(output)
                    } else {
                        resolve()
                    }
                } else {
                    reject(`${output}\n${message} ${code}`)
                }
            })
        })
    }

    /**
    * Checks if a command is available.
    *
    * @param {string} command - The command to check availability for.
    * @return {Promise<boolean>} A promise that resolves to a boolean value indicating if the command is available.
    */
    public static async checkCommand(command: string): Promise<boolean> {
        return new Promise<boolean>((resolve) => {
            const commandName = process.platform === 'win32' ? 'where' : 'command -v';
            const childProcess = spawn(commandName, [command], {
                shell: true
            })

            childProcess.on('exit', (code) => {
                const isAvailable = code === 0;
                resolve(isAvailable)
            })

            childProcess.on('error', (err) => {
                Logger.error(err)
                resolve(false)
            })
        })
    }
}

export default Shell;