import { shell, isCommandAvailable } from './shell'

describe('shell', () => {
    it('should execute a shell command asynchronously', async () => {
        const command = 'echo "Hello, World"';
        const expectedOutput = 'Hello, World\n';
        const onDataCallback = jest.fn();

        await shell(command, 0, onDataCallback);

        expect(onDataCallback).toHaveBeenCalledWith(expectedOutput);
    })

    it('should reject with an error message when the command exist with an error code', async () => {
        const command = 'nonexistent-command';
        const onDataCallback = jest.fn();

        try {
            await shell(command, 1, onDataCallback);
        } catch (error) {
            expect(error).toContain('Program exited with code');
        }
    })
})

describe('isCommandAvailable', () => {
    it('should resolve to true if the command is available', async () => {
        const command = 'echo';
        const isAvailable = await isCommandAvailable(command);
        expect(isAvailable).toBeTruthy();
    })

    it('should resolve to false if the command is not available', async () => {
        const command = 'nonexistent-command';
        const isAvailable = await isCommandAvailable(command);
        expect(isAvailable).toBeFalsy();
    })
})