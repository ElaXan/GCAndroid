class Config {
    private static tmpPath() {
        if (process.platform === 'win32') {
            return `${process.env.TMP}/GCAndroid`;
        } else if (process.platform === 'android') {
            return `${process.env.PREFIX}/tmp/GCAndroid`;
        } else {
            return '/tmp/GCAndroid';
        }
    }
    /**
     * Returns the path to the GCAndroid directory based on the current platform.
     *
     * @return {string} The path to the GCAndroid directory.
     */
    public static gcandroidPath = process.platform === 'win32' ? `${process.env.LOCALAPPDATA}/GCAndroid` : `${process.env.HOME}/.GCAndroid`;
    

    /**
     * Returns the path to the config.json file.
     * 
     * @return {string} The path to the config.json file.
     */
    public static config: string = `${Config.gcandroidPath}/config.json`;

    /**
     * Returns the path to the temporary directory for the installation process.
     *
     * @return {string} The path to the temporary directory.
     */
    public static tmp = `${this.tmpPath()}`;

    /**
     * Returns the default path for the Grasscutter based on the operating system.
     *
     * @return {string} The default path for the Grasscutter.
     */
    public static defaultGrasscutterPath = process.platform === 'win32' ? `${process.env.LOCALAPPDATA}/Grasscutter` : `${process.env.HOME}/Grasscutter`;
    
    public static defaultPort = process.platform === 'android' ? '54321' : '443';
}

export default Config;
