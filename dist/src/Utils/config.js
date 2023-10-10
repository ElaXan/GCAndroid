"use strict";
var _a;
Object.defineProperty(exports, "__esModule", { value: true });
class Config {
    static tmpPath() {
        if (process.platform === 'win32') {
            return `${process.env.TMP}/Polycutter`;
        }
        else if (process.platform === 'android') {
            return `${process.env.PREFIX}/tmp/Polycutter`;
        }
        else {
            return '/tmp/Polycutter';
        }
    }
}
_a = Config;
/**
 * Returns the path to the Polycutter directory based on the current platform.
 *
 * @return {string} The path to the Polycutter directory.
 */
Config.polycutterPath = process.platform === 'win32' ? `${process.env.LOCALAPPDATA}/Polycutter` : `${process.env.HOME}/.Polycutter`;
/**
 * Returns the path to the config.json file.
 *
 * @return {string} The path to the config.json file.
 */
Config.config = `${_a.polycutterPath}/config.json`;
/**
 * Returns the path to the temporary directory for the installation process.
 *
 * @return {string} The path to the temporary directory.
 */
Config.tmp = `${_a.tmpPath()}`;
/**
 * Returns the default path for the Grasscutter based on the operating system.
 *
 * @return {string} The default path for the Grasscutter.
 */
Config.defaultGrasscutterPath = process.platform === 'win32' ? `${process.env.LOCALAPPDATA}/Grasscutter` : `${process.env.HOME}/Grasscutter`;
Config.defaultPort = process.platform === 'android' ? '54321' : '443';
exports.default = Config;
