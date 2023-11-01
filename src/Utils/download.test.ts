import DownloadTask from "./download";
import fs from 'fs';

describe('DownloadTask', () => {
    afterAll(() => {
        fs.unlinkSync('test.txt');
    })

    it('should download a file', async () => {
        const url = 'https://google.com';
        const outputPath = 'test.txt';
        const downloadTask = new DownloadTask(url, outputPath);
        await downloadTask.execute(() => {});
        const fileExist = await fs.promises.access(outputPath, fs.constants.F_OK).then(() => true).catch(() => false);
        expect(fileExist).toBe(true);
    })
})