import Logger, { ColorCode } from "./log";

describe("Logger", () => {
    let originalConsoleLog: any;

    beforeAll(() => {
        originalConsoleLog = console.log;

        console.log = jest.fn();
    });

    afterAll(() => {
        console.log = originalConsoleLog;
    });

    describe('info', () => {
        it('should log an informational message with the correct color code', () => {
            Logger.info('This is an info message');
            const logOutput = (console.log as jest.Mock).mock.calls[0];
            expect(logOutput[0]).toContain(`[${ColorCode.Blue}Polycutter${ColorCode.Reset} -> ${ColorCode.Green}INFO${ColorCode.Reset}]`)
            expect(logOutput[1]).toContain('This is an info message')
        })
    })

    describe('error', () => {
        it('should log an error message with the correct color code', () => {
            Logger.error('This is an error message');
            const logOutput = (console.log as jest.Mock).mock.calls[0];
            expect(logOutput[0]).toContain(`[${ColorCode.Blue}Polycutter${ColorCode.Reset} -> ${ColorCode.Red}ERROR${ColorCode.Reset}]:`)
            expect(logOutput[1]).toContain('This is an error message')
        })
    })

    describe('warn', () => {
        it('should log a warning message with the correct color code', () => {
            Logger.warn('This is an warning message');
            const logOutput = (console.log as jest.Mock).mock.calls[0];
            expect(logOutput[0]).toContain(`[${ColorCode.Blue}Polycutter${ColorCode.Reset} -> ${ColorCode.Yellow}WARN${ColorCode.Reset}]:`)
            expect(logOutput[1]).toContain('This is an warning message')
        })
    })
})