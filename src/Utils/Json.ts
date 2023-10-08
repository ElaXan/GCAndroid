import fs from 'fs';

export default class JSONUtility {
    private path: string;
    private keyPath: string;

    constructor(options: { path: string, keyPath: string }) {
        this.path = options.path;
        this.keyPath = options.keyPath;
    }

    public read(): any {
        try {
            const jsonData = JSON.parse(fs.readFileSync(this.path, 'utf-8'))
            const keys = this.keyPath.split('.')

            let current = jsonData;
            for (let i = 0; i < keys.length; i++) {
                const key = keys[i]
                if (!current[key]) {
                    throw new Error(`Invalid key path: ${this.keyPath}`)
                }
                current = current[key];
            }

            return current
        } catch (error) {
            console.error('Error:', error)
            throw error;
        }
    }

    public write(newValue: any): void {
        try {
            const jsonData = JSON.parse(fs.readFileSync(this.path, 'utf-8'))

            const keys = this.keyPath.split('.')

            let current = jsonData;
            for (let i = 0; i < keys.length - 1; i++) {
                const key = keys[i]
                if (!current[key]) {
                    throw new Error(`Invalid key path: ${this.keyPath}`)
                }
                current = current[key];
            }
            const lastKey = keys[keys.length - 1];
            current[lastKey] = newValue;
            fs.writeFileSync(this.path, JSON.stringify(jsonData, null, 2))
        } catch (error) {
            console.error('Error:', error)
            throw error
        }
    }
}