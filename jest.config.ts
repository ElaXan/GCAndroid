/**
 * For a detailed explanation regarding each configuration property, visit:
 * https://jestjs.io/docs/configuration
 */

import type { Config } from 'jest';

const config: Config = {
    preset: 'ts-jest',
    clearMocks: true,
    collectCoverage: true,
    testEnvironment: 'node',
    transform:{
        '^.+\\.(ts|tsx)$': 'ts-jest'
    },
    testRegex: '(/__tests__/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$'
};

export default config;
