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
exports.gcandroidVersion = void 0;
const commander_1 = require("commander");
const grasscutter_1 = __importDefault(require("./src/Install/grasscutter"));
const run_1 = __importDefault(require("./src/run"));
const Utils_1 = require("./src/Utils");
const axios_1 = __importDefault(require("axios"));
exports.gcandroidVersion = '3.7.0';
(() => __awaiter(void 0, void 0, void 0, function* () {
}))();
commander_1.program.version(exports.gcandroidVersion);
commander_1.program.command('install')
    .description('Install Grasscutter')
    .action(() => __awaiter(void 0, void 0, void 0, function* () {
    yield (0, grasscutter_1.default)();
}));
commander_1.program.command('run')
    .option('-p, --port <port>', 'Change/Custom port to run Grasscutter')
    .option('--path <path>', 'Path to grasscutter.jar')
    .description('Run Grasscutter')
    .action((str) => __awaiter(void 0, void 0, void 0, function* () {
    const getPath = str.path;
    const port = parseInt(str.port);
    yield (0, run_1.default)(getPath, port);
}));
commander_1.program.command('update')
    .description('Update GCAndroid')
    .action(() => __awaiter(void 0, void 0, void 0, function* () {
    const checkUpdate = 'https://gcandroid.elaxan.com/api/version';
    const response = yield axios_1.default.post(checkUpdate, {}, {
        timeout: 10000
    }).then((res) => res.data);
    const newVersion = response[0];
    if (parseInt(newVersion.version) > parseInt(exports.gcandroidVersion)) {
        console.log('Update available');
    }
    yield (0, Utils_1.handleUpdate)(newVersion);
}));
commander_1.program.parse(process.argv);
