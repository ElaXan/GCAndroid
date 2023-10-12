enum ColorCode {
    Reset = '\x1b[0m',
    Green = '\x1b[32m',
    Red = '\x1b[31m',
    Yellow = '\x1b[33m'
}

export default class Logger {
    private static log(level: string, colorCode: ColorCode, ...message: any[]): void {
        const formattedMessage = `[${colorCode}${level}${ColorCode.Reset}]:`;
        console.log(formattedMessage, ...message);
    }

    public static info(...message: any[]): void {
        this.log('INFO', ColorCode.Green, ...message)
    }

    public static error(...message: any[]): void {
        this.log('ERROR', ColorCode.Red, ...message)
    }

    public static warn(...message: any[]): void {
        this.log('WARN', ColorCode.Yellow, ...message);
    }
}