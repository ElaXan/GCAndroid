import fs from 'fs';
import fse from 'fs-extra';
import File from './file';

describe('File', () => {
    beforeAll(async () => {
        // Create any necessary files or directories before running the tests.
        await fs.promises.writeFile('old.txt', 'test');
        await fs.promises.writeFile('src.txt', 'test');
        await fs.promises.writeFile('moveOld.txt', 'test');
    });

    afterAll(async () => {
        // Clean up files and directories after all tests have finished.
        fs.unlinkSync('new.txt');
        fs.unlinkSync('src.txt');
        fs.unlinkSync('dest.txt');
        fs.unlinkSync('moveNew.txt');
    });

    describe('rename', () => {
        it('should rename a file', async () => {
            const oldPath = 'old.txt';
            const newPath = 'new.txt';
            await File.rename(oldPath, newPath);
            const fileExist = await fs.promises.access(newPath).then(() => true).catch(() => false);
            expect(fileExist).toBe(true);
        });
    });

    describe('copy', () => {
        it('should copy a file', async () => {
            const source = 'src.txt';
            const destination = 'dest.txt';
            await File.copy(source, destination);
            const fileExist = await fs.promises.access(destination).then(() => true).catch(() => false);
            expect(fileExist).toBe(true);
        });
    });

    describe('move', () => {
        it('should move a file', async () => {
            const source = 'moveOld.txt';
            const destination = 'moveNew.txt';
            await File.move(source, destination);
            const sourceExists = await fs.promises.access(source).then(() => true).catch(() => false);
            const destinationExists = await fs.promises.access(destination).then(() => true).catch(() => false);
            expect(sourceExists).toBe(false);
            expect(destinationExists).toBe(true);
        });
    });

    describe('remove', () => {
        it('should remove a file', async () => {
            const filePath = 'fileToRemove.txt';
            await fs.promises.writeFile(filePath, 'test');
            await File.remove(filePath);
            const fileExist = await fs.promises.access(filePath, fs.constants.F_OK).then(() => true).catch(() => false);
            expect(fileExist).toBe(false);
        });

        it('should remove a directory', async () => {
            const dirPath = 'dirToRemove';
            await fse.ensureDir(dirPath);
            await File.remove(dirPath);
            const dirExist = await fs.promises.access(dirPath, fs.constants.F_OK).then(() => true).catch(() => false);
            expect(dirExist).toBe(true);
        });

        it('should throw an error for an invalid path', async () => {
            const invalidPath = 'invalidPath';

            expect(async () => {
                await File.remove(invalidPath);
            }).rejects.toThrow(`${invalidPath} is not found.`);
        });
    });
});
