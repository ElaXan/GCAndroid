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
const child_process_1 = require("child_process");
const Utils_1 = require("./Utils");
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
function default_1(pathExecuteJar, port) {
    var _a, _b;
    return __awaiter(this, void 0, void 0, function* () {
        let pathJar;
        if (pathExecuteJar) {
            pathJar = pathExecuteJar;
        }
        else {
            pathJar = `${Utils_1.Config.defaultGrasscutterPath}/grasscutter.jar`;
        }
        if (port && typeof port !== 'number') {
            throw new Error('Port must be a number.');
        }
        if (!fs_1.default.existsSync(pathJar)) {
            throw new Error(`${pathJar} does not exist.`);
        }
        if (!(yield (0, Utils_1.isCommandAvailable)('java'))) {
            throw new Error('Java command is not found. Is java installed?');
        }
        process.chdir(path_1.default.dirname(pathJar));
        const jsonUtility = new Utils_1.JSONUtility({ keyPath: 'server.http.bindPort', path: './config.json' });
        console.log('Execute/Run grasscutter.jar');
        console.log('Path .jar: ' + pathJar);
        if (fs_1.default.existsSync(path_1.default.join(Utils_1.Config.defaultGrasscutterPath, '/config.json'))) {
            if (port) {
                jsonUtility.write(port);
            }
            console.log('Path config.json: ' + path_1.default.join(pathJar, 'config.json'));
            console.log('Port:', jsonUtility.read());
        }
        const child = (0, child_process_1.spawn)('java -jar grasscutter.jar', { shell: true, stdio: 'inherit' });
        (_a = child.stdout) === null || _a === void 0 ? void 0 : _a.on('data', (chunk) => {
            console.log(chunk.toString());
        });
        (_b = child.stderr) === null || _b === void 0 ? void 0 : _b.on('data', (chunk) => {
            console.log(chunk.toString());
        });
        child.on('exit', (code) => {
            console.log('Program exited with code ' + code);
        });
    });
}
exports.default = default_1;
