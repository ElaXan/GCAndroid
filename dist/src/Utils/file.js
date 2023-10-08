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
const fs_1 = __importDefault(require("fs"));
const glob_1 = require("glob");
const fs_extra_1 = __importDefault(require("fs-extra"));
const unzipper_1 = __importDefault(require("unzipper"));
const iconv_lite_1 = __importDefault(require("iconv-lite"));
const rimraf_1 = require("rimraf");
class File {
    /**
     * Renames a file or directory.
     *
     * @param {string} oldPath - The path of the file or directory to be renamed.
     * @param {string} newPath - The new path for the file or directory.
     * @return {Promise<string>} A promise that resolves to a success message after the file or directory has been renamed.
     */
    static rename(oldPath, newPath) {
        const files = glob_1.glob.globSync(oldPath);
        if (files.length === 0) {
            throw new Error(`No files found in ${oldPath}`);
        }
        const oldFilePath = files[0];
        const newFilePath = oldFilePath.replace(oldFilePath, newPath);
        return new Promise((resolve, reject) => {
            fs_1.default.rename(oldFilePath, newFilePath, (err) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(`Success rename ${oldFilePath} to ${newFilePath}`);
                }
            });
        });
    }
    /**
     * Copies the files or directories specified by the given pattern to the destination directory.
     *
     * @param {string} pattern - The pattern specifying the files or directories to copy.
     * @param {string} destination - The destination directory where the files or directories will be copied to.
     * @return {Promise<string>} A promise that resolves to a success message when the copy operation is complete.
     */
    static copy(pattern, destination) {
        return new Promise((resolve, reject) => {
            fs_extra_1.default.copy(pattern, destination, (err) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(`Success copy ${pattern} to ${destination}`);
                }
            });
        });
    }
    /**
     * Move files or folders from a source pattern to a destination.
     *
     * @param {string} sourcePattern - The pattern to match files or folders to be moved.
     * @param {string} destination - The destination path to move the files or folders to.
     * @return {Promise<string>} A promise that resolves with a success message when the move operation is complete.
     * @throws {Error} Throws an error if no file or folder is found in the source pattern.
     */
    static move(sourcePattern, destination) {
        const pattern = glob_1.glob.globSync(sourcePattern);
        if (pattern.length === 0) {
            throw new Error(`No file/folder found in ${sourcePattern}`);
        }
        const oldPattern = pattern[0];
        const newPattern = oldPattern.replace(oldPattern, destination);
        return new Promise((resolve, reject) => {
            fs_extra_1.default.move(oldPattern, newPattern, (err) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(`Success move file/folder from ${oldPattern} to ${newPattern}`);
                }
            });
        });
    }
    /**
     * Removes a file from the specified path.
     *
     * @param {string} path - The path of the file to be removed.
     * @returns {Promise<void>} A promise that resolves when the file is successfully removed, and rejects with an error if there was an issue.
     */
    static remove(path) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const stats = fs_1.default.statSync(path);
                if (stats.isDirectory()) {
                    (0, rimraf_1.rimraf)(path, { glob: true });
                }
                else if (stats.isFile()) {
                    yield fs_1.default.promises.unlink(path);
                }
                else {
                    throw new Error(`${path} is neither a file nor a directory.`);
                }
            }
            catch (error) {
                console.error(`Error removing ${path}:`, error);
                throw error;
            }
        });
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
    static extract({ zipPath, destination }, callback) {
        const entries = [];
        return new Promise((resolve, reject) => {
            fs_1.default.createReadStream(zipPath)
                .pipe(unzipper_1.default.Parse())
                .on('entry', (entry) => {
                entries.push(entry);
                const path = entry.path;
                const type = entry.type;
                const isUnicode = entry.props.flags.isUnicode;
                const pathExtract = destination ? `${destination}/${path}` : path;
                const fileName = isUnicode ? pathExtract : iconv_lite_1.default.decode(entry.props.pathBuffer, 'cp866');
                if (type === 'Directory') {
                    fs_1.default.mkdirSync(pathExtract, { recursive: true });
                }
                else if (type === 'File') {
                    entry.pipe(fs_1.default.createWriteStream(fileName));
                }
                callback(`Extracting: ${path}`);
            })
                .promise()
                .then(() => {
                callback('Extraction completed successfully');
                resolve();
            })
                .catch((error) => {
                reject(error);
            });
        });
    }
}
exports.default = File;
