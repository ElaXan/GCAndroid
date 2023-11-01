import fs from 'fs';
import { glob } from 'glob';
import fse from 'fs-extra';
import unzipper from 'unzipper';
import il from 'iconv-lite';
import { rimraf } from 'rimraf'

export default class File {
    /**
     * Renames a file or directory.
     *
     * @param {string} oldPath - The path of the file or directory to be renamed.
     * @param {string} newPath - The new path for the file or directory.
     * @return {Promise<string>} A promise that resolves to a success message after the file or directory has been renamed.
     */
    public static rename(oldPath: string, newPath: string): Promise<string> {
        const files = glob.globSync(oldPath);

        if (files.length === 0) {
            throw new Error(`No files found in ${oldPath}`);
        }

        const oldFilePath = files[0];
        const newFilePath = oldFilePath.replace(oldFilePath, newPath);

        return new Promise<string>((resolve, reject) => {
            fs.rename(oldFilePath, newFilePath, (err) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(`Success rename ${oldFilePath} to ${newFilePath}`);
                }
            })
        })
    }

    /**
     * Copies the files or directories specified by the given pattern to the destination directory.
     *
     * @param {string} pattern - The pattern specifying the files or directories to copy.
     * @param {string} destination - The destination directory where the files or directories will be copied to.
     * @return {Promise<string>} A promise that resolves to a success message when the copy operation is complete.
     */
    public static copy(pattern: string, destination: string): Promise<string> {
        return new Promise<string>((resolve, reject) => {
            fse.copy(pattern, destination, (err) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(`Success copy ${pattern} to ${destination}`);
                }
            })
        })
    }

    /**
     * Move files or folders from a source pattern to a destination.
     *
     * @param {string} sourcePattern - The pattern to match files or folders to be moved.
     * @param {string} destination - The destination path to move the files or folders to.
     * @return {Promise<string>} A promise that resolves with a success message when the move operation is complete.
     * @throws {Error} Throws an error if no file or folder is found in the source pattern.
     */
    public static move(sourcePattern: string, destination: string): Promise<string> {
        const pattern = glob.globSync(sourcePattern);
        if (pattern.length === 0) {
            throw new Error(`No file/folder found in ${sourcePattern}`)
        }
        const oldPattern = pattern[0];
        const newPattern = oldPattern.replace(oldPattern, destination);
        return new Promise<string>((resolve, reject) => {
            fse.move(oldPattern, newPattern, (err) => {
                if (err) {
                    reject(err)
                } else {
                    resolve(`Success move file/folder from ${oldPattern} to ${newPattern}`)
                }
            })
        })
    }

    /**
     * Removes a file from the specified path.
     *
     * @param {string} path - The path of the file to be removed.
     * @returns {Promise<void>} A promise that resolves when the file is successfully removed, and rejects with an error if there was an issue.
     */
    public static async remove(path: string): Promise<void> {
        try {
            const stats = fs.statSync(path);

            if (stats.isDirectory()) {
                rimraf(path, { glob: true })
            } else if (stats.isFile()) {
                await fs.promises.unlink(path);
            } else {
                throw new Error(`${path} is neither a file nor a directory.`)
            }
        } catch (error) {
            if ((error instanceof Error)) {
                throw error;
            } else {
                throw new Error(`${path} is not found.`);
            }
            
        }
    }

    /**
     * Extracts files from a zip archive to a specified destination.
     *
     * @param {Object} options - An object containing the zipPath and destination parameters.
     * @param {string} options.zipPath - The path to the zip archive.
     * @param {string} [options.destination] - The destination directory to extract the files to. If not provided, the files will be extracted to the current directory.
     * @param {Function} callback - A callback function that will be called with progress messages during the extraction process.
     * @returns {Promise<void>} A promise that resolves when the extraction is complete.
     */
    public static extract({ zipPath, destination }: { zipPath: string, destination?: string }, callback: (data: string) => void): Promise<void> {
        const entries: unzipper.Entry[] = [];
        return new Promise<void>((resolve, reject) => {
            fs.createReadStream(zipPath)
                .pipe(unzipper.Parse())
                .on('entry', (entry) => {
                    entries.push(entry)
                    const { path, type } = entry;
                    const { isUnicode } = entry.props.flags;
                    const pathExtract = destination ? `${destination}/${path}` : path;
                    const fileName = isUnicode ? pathExtract : il.decode(entry.props.pathBuffer, 'cp866')
                    if (type === 'Directory') {
                        fs.mkdirSync(pathExtract, { recursive: true });
                    } else if (type === 'File') {
                        entry.pipe(fs.createWriteStream(fileName));
                    }
                    callback(`Extracting: ${path}`);
                })
                .promise()
                .then(() => {
                    callback('Extraction completed successfully')
                    resolve()
                })
                .catch((error) => {
                    reject(error)
                })
        })
    }
}
