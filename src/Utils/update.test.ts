import handleUpdate from './update';

describe('handleUpdate', () => {

    let consoleLogSpy: jest.SpyInstance;
    beforeEach(() => {
        consoleLogSpy = jest.spyOn(console, 'log').mockImplementation();
    })

    afterEach(() => {
        consoleLogSpy.mockRestore();
    })

    it('should return no update', async () => {
        expect(consoleLogSpy).not.toHaveBeenCalled();

        await handleUpdate({ polycutterVersion: '1.0.2' });

        const logOutput = (consoleLogSpy as jest.Mock).mock.calls;
        
        expect(logOutput[0][0]).toBe('Checking update');
        expect(logOutput[1][0]).toContain('Looks like there is no update for Polycutter');

    })
})