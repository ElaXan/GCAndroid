import fs from 'fs';

export default class JSONUtility {
    private path: string;
    private keyPath: string;

    /**
     * Creates a new instance of the constructor.
     *
     * @param {Object} options - The options for the constructor.
     * @param {string} options.path - The path parameter.
     * @param {string} options.keyPath - The keyPath parameter.
     */
    constructor(options: { path: string, keyPath: string }) {
        this.path = options.path;
        this.keyPath = options.keyPath;
    }

    /**
     * Reads the contents of a JSON file located at the specified path
     * and returns the value at the specified key path.
     *
     * @return {any} The value at the specified key path in the JSON file.
     * @throws {Error} If the key path is invalid or if an error occurs while reading the file.
     */
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
            if ((error instanceof Error)) {
                throw error
            } else {
                throw new Error(`no such file or directory, open '${this.path}'`)
            }
        }
    }

    /**
     * Writes a new value to a JSON file.
     *
     * @param {any} newValue - The new value to be written.
     * @return {void} This function does not return anything.
     */
    public write(newValue: any): void {
        try {
            const jsonData = JSON.parse(fs.readFileSync(this.path, 'utf-8'))

            const keys = this.keyPath.split('.')
            
            let current = jsonData;
            keys.forEach((key, index) => {
                const nextKey = keys[index + 1]
                if (!current[key]) {
                    current[key] = {}
                }
                if (nextKey) {
                    current = current[key]
                } else {
                    current[key] = newValue
                }
            })
            fs.writeFileSync(this.path, JSON.stringify(jsonData, null, 2))
        } catch (error) {
            if ((error instanceof Error)) {
                throw error
            } else {
                throw new Error(`no such file or directory, open '${this.path}'`)
            }
        }
    }
}