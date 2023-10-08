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
const axios_1 = __importDefault(require("axios"));
const fs_1 = require("fs");
const stream_1 = require("stream");
const axiosInstance = axios_1.default.create();
axiosInstance.interceptors.response.use((response) => response, (error) => {
    return Promise.reject(error);
});
class DownloadTask {
    /**
    * Creates a new instance of the constructor.
    *
    * @param {string} url - The URL to use.
    * @param {string} outputPath - The output path to use.
    */
    constructor(url, outputPath) {
        this.url = url;
        this.outputPath = outputPath;
    }
    /**
    * Executes the function and reports progress updates.
    *
    * @param {Function} onProgress - A callback function that receives progress updates.
    *                               It takes two parameters: progress (a number between 0 and 100)
    *                               and eta (estimated time of arrival in the format 'Xm Ys').
    * @return {Promise<void>} - A promise that resolves when the function execution is complete.
    *                          It does not return any value.
    */
    execute(onProgress) {
        return __awaiter(this, void 0, void 0, function* () {
            const response = yield axiosInstance.get(this.url, {
                responseType: 'stream'
            });
            const totalSize = Number(response.headers['content-length']);
            let downloadSize = 0;
            let lastSize = 0;
            const startTime = Date.now();
            const progressBar = new stream_1.Transform({
                transform(chunk, encoding, callback) {
                    downloadSize += chunk.length;
                    const progress = (downloadSize / totalSize) * 100;
                    const currentTime = Date.now();
                    const elapsedSeconds = (currentTime - startTime) / 1000;
                    const speed = (downloadSize - lastSize) / elapsedSeconds;
                    lastSize = downloadSize;
                    const remainingSize = totalSize - downloadSize;
                    const etaSeconds = remainingSize / speed;
                    const etaMinutes = Math.floor(etaSeconds / 60);
                    const etaSecondsRemaining = Math.floor(etaSeconds % 60);
                    onProgress(progress || 0, `${etaMinutes || '0'}m ${etaSecondsRemaining || '0'}s`);
                    this.push(chunk);
                    callback();
                }
            });
            const writeStream = (0, fs_1.createWriteStream)(this.outputPath);
            response.data.pipe(progressBar).pipe(writeStream);
            return new Promise((resolve, reject) => {
                writeStream.on('finish', () => {
                    resolve();
                });
                writeStream.on('error', (error) => {
                    reject(error);
                });
            });
        });
    }
}
exports.default = DownloadTask;
