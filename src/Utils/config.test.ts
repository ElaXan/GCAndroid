import Config from './config';

describe('Config', () => {
    it('should set the tmpPath based on the platform', () => {
        const tmpPath = Config['tmpPath']();
        if (process.platform === 'win32') {
            expect(tmpPath).toBe(`${process.env.TMP}/Polycutter`);
        } else if (process.platform === 'android') {
            expect(tmpPath).toBe(`${process.env.PREFIX}/tmp/Polycutter`);
        } else {
            expect(tmpPath).toBe('/tmp/Polycutter');
        }
    });

    it('should set polycutterPath based on the platform', () => {
        const polycutterPath = Config.polycutterPath;
        if (process.platform === 'win32') {
            expect(polycutterPath).toBe(`${process.env.LOCALAPPDATA}/Polycutter`);
        } else {
            expect(polycutterPath).toBe(`${process.env.HOME}/.Polycutter`);
        }
    });

    it('should set config based on polycutterPath', () => {
        expect(Config.config).toBe(`${Config.polycutterPath}/config.json`);
    });

    it('should set tmp based on tmpPath', () => {
        expect(Config.tmp).toBe(Config['tmpPath']());
    });

    it('should set defaultGrasscutterPath based on the platform', () => {
        const defaultGrasscutterPath = Config.defaultGrasscutterPath;
        if (process.platform === 'win32') {
            expect(defaultGrasscutterPath).toBe(`${process.env.LOCALAPPDATA}/Grasscutter`);
        } else {
            expect(defaultGrasscutterPath).toBe(`${process.env.HOME}/Grasscutter`);
        }
    });

    it('should set defaultPort based on the platform', () => {
        const defaultPort = Config.defaultPort;
        if (process.platform === 'android') {
            expect(defaultPort).toBe('54321');
        } else {
            expect(defaultPort).toBe('443');
        }
    });
});
