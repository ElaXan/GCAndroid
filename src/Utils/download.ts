import axios, { AxiosResponse } from 'axios';
import { createWriteStream } from 'fs';
import { Transform } from 'stream'

const axiosInstance = axios.create();
axiosInstance.interceptors.response.use(
    (response) => response,
    (error) => {
        return Promise.reject(error)
    }
)

export default class DownloadTask {
    private url: string;
    private outputPath: string;

    /**
    * Creates a new instance of the constructor.
    *
    * @param {string} url - The URL to use.
    * @param {string} outputPath - The output path to use.
    */
    constructor(url: string, outputPath: string) {
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
    public async execute(onProgress: (progress: number, eta: string) => void): Promise<void> {
        const response: AxiosResponse = await axiosInstance.get(this.url, {
            responseType: 'stream'
        });

        const totalSize = Number(response.headers['content-length']);

        let downloadSize = 0;
        let lastSize = 0;
        const startTime = Date.now();

        const progressBar = new Transform({
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

                onProgress(progress || 0, `${etaMinutes || '0'}m ${etaSecondsRemaining || '0'}s`)
                this.push(chunk)
                callback();
            }
        })

        const writeStream = createWriteStream(this.outputPath);
        response.data.pipe(progressBar).pipe(writeStream);

        return new Promise<void>((resolve, reject) => {
            writeStream.on('finish', () => {
                resolve()
            })
            writeStream.on('error', (error) => {
                reject(error)
            })
        })
    }
}