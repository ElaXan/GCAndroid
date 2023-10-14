import DownloadTask from "./download";
import fs from 'fs';

describe('DownloadTask', () => {
    afterAll(() => {
        if (fs.existsSync('test.txt')) {
            fs.unlinkSync('test.txt');
        }
    })
    it('should execute', async () => {
        // I don't know how to make this test work with jest
        const downloadTask = new DownloadTask('https://www.google.com', 'test.txt');
        const onProgress = jest.fn();
        await downloadTask.execute(onProgress);
        expect(onProgress).toHaveBeenCalled();
        expect(onProgress.mock.calls.length).toBeGreaterThan(5);
    })   
})