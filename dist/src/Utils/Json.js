"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = __importDefault(require("fs"));
class JSONUtility {
    constructor(options) {
        this.path = options.path;
        this.keyPath = options.keyPath;
    }
    read() {
        try {
            const jsonData = JSON.parse(fs_1.default.readFileSync(this.path, 'utf-8'));
            const keys = this.keyPath.split('.');
            let current = jsonData;
            for (let i = 0; i < keys.length; i++) {
                const key = keys[i];
                if (!current[key]) {
                    throw new Error(`Invalid key path: ${this.keyPath}`);
                }
                current = current[key];
            }
            return current;
        }
        catch (error) {
            console.error('Error:', error);
            throw error;
        }
    }
    write(newValue) {
        try {
            const jsonData = JSON.parse(fs_1.default.readFileSync(this.path, 'utf-8'));
            const keys = this.keyPath.split('.');
            let current = jsonData;
            for (let i = 0; i < keys.length - 1; i++) {
                const key = keys[i];
                if (!current[key]) {
                    throw new Error(`Invalid key path: ${this.keyPath}`);
                }
                current = current[key];
            }
            const lastKey = keys[keys.length - 1];
            current[lastKey] = newValue;
            fs_1.default.writeFileSync(this.path, JSON.stringify(jsonData, null, 2));
        }
        catch (error) {
            console.error('Error:', error);
            throw error;
        }
    }
}
exports.default = JSONUtility;
