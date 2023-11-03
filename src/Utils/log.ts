/**
 * Enum representing color codes.
 */
export enum ColorCode {
    /**
     * Reset color code.
     */
    Reset = '\x1b[0m',
    /**
     * Green color code.
     */
    Green = '\x1b[32m',
    /**
     * Red color code.
     */
    Red = '\x1b[31m',
    /**
     * Blue color code.
     */
    Blue = '\x1b[34m',
    /**
     * Yellow color code.
     */
    Yellow = '\x1b[33m'
}

export default class Logger {
    /**
     * Logs a message with the specified log level and color code.
     *
     * @param {string} level - The log level.
     * @param {ColorCode} colorCode - The color code.
     * @param {...any[]} message - The message to be logged.
     * @return {void}
     */
    private static log(level: string, colorCode: ColorCode, ...message: any[]): void {
        const formattedMessage = `[${ColorCode.Blue}Polycutter${ColorCode.Reset} -> ${colorCode}${level}${ColorCode.Reset}]:`;
        console.log(formattedMessage, ...message);
    }

    /**
     * Logs an informational message.
     *
     * @param {...any[]} message - The message to be logged.
     * @return {void} - This function does not return anything.
     */
    public static info(...message: any[]): void {
        this.log('INFO', ColorCode.Green, ...message)
    }

    /**
     * Prints an error message to the console.
     *
     * @param {...any[]} message - The error message to be printed.
     * @return {void} - This function does not return anything.
     */
    public static error(...message: any[]): void {
        this.log('ERROR', ColorCode.Red, ...message)
    }

    /**
     * Logs a warning message.
     *
     * @param {...any[]} message - The message(s) to be logged.
     * @return {void} - This function does not return anything.
     */
    public static warn(...message: any[]): void {
        this.log('WARN', ColorCode.Yellow, ...message);
    }
}