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
Object.defineProperty(exports, "__esModule", { value: true });
exports.isCommandAvailable = exports.shell = void 0;
const child_process_1 = require("child_process");
/**
* Executes a shell command asynchronously.
*
* @param {string} command - The shell command to execute.
* @param {number} errorCode - The expected exit code of the command.
* @param {Function} onDataCallback - A callback function to handle the command output.
* @return {Promise<void>} A promise that resolves when the command completes successfully, or rejects with an error message.
*/
function shell(command, errorCode, onDataCallback) {
    return __awaiter(this, void 0, void 0, function* () {
        let output = '';
        return new Promise((resolve, reject) => {
            var _a, _b;
            const cloneProcess = (0, child_process_1.spawn)(command, { shell: true });
            (_a = cloneProcess.stdout) === null || _a === void 0 ? void 0 : _a.on('data', (data) => {
                output += data.toString();
                onDataCallback(data.toString());
            });
            (_b = cloneProcess.stderr) === null || _b === void 0 ? void 0 : _b.on('data', (data) => {
                output += data.toString();
                onDataCallback(data.toString());
            });
            cloneProcess.on('close', (code) => {
                const message = 'Program exited with code';
                if (code === errorCode) {
                    resolve();
                }
                else {
                    reject(`${output}\n${message} ${code}`);
                }
            });
        });
    });
}
exports.shell = shell;
function isCommandAvailable(command) {
    return __awaiter(this, void 0, void 0, function* () {
        return new Promise((resolve) => {
            const commandName = process.platform === 'win32' ? 'where' : 'which';
            const childProcess = (0, child_process_1.spawn)(commandName, [command]);
            childProcess.on('exit', (code) => {
                const isAvailable = code === 0;
                resolve(isAvailable);
            });
            childProcess.on('error', () => {
                resolve(false);
            });
        });
    });
}
exports.isCommandAvailable = isCommandAvailable;
