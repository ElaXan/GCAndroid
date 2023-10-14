import fs from 'fs';
import JSONUtility from './Json';

describe('JSONUtility', () => {
    const testFilePath = 'test.json';

    beforeEach(() => {
        fs.writeFileSync(testFilePath, JSON.stringify({
            key1: {
                key2: {
                    key3: 'value'
                }
            }
        }, null, 2));
    })

    afterEach(() => {
        fs.unlinkSync(testFilePath);
    })

    describe('read', () => {
        it('should read a JSON data from the specified path', () => {
            const jsonUtility = new JSONUtility({ path: testFilePath, keyPath: 'key1.key2.key3' });
            const value = jsonUtility.read();
            expect(value).toBe('value');
        });

        it('should thrown an error for an invalid key path', () => {
            const jsonUtility = new JSONUtility({ path: testFilePath, keyPath: 'invalidKeyPath' });
            expect(() => jsonUtility.read()).toThrow('Invalid key path: invalidKeyPath');
        });

        it('should thrown an error if the file does not exist', () => {
            const nonExistentFilePath = 'nonExistentFilePath.json';
            const jsonUtility = new JSONUtility({ path: nonExistentFilePath, keyPath: 'key1.key2.key3' });
            expect(() => jsonUtility.read()).toThrow();
        })
    })

    describe('write', () => {
        it('should write a new value to the JSON file', () => {
            const jsonUtility = new JSONUtility({ path: testFilePath, keyPath: 'key1.key2.key3' });
            jsonUtility.write('new-value');
            const jsonData = JSON.parse(fs.readFileSync(testFilePath, 'utf-8'));
            expect(jsonData.key1.key2.key3).toBe('new-value');
        })

        it('should throw an error if the file does not exist', () => {
            const nonExistentFilePath = 'nonExistentFilePath.json';
            const jsonUtility = new JSONUtility({ path: nonExistentFilePath, keyPath: 'key1.key2.key3' });
            expect(() => jsonUtility.write('new-value')).toThrow();
        })
    })
})