/** @type {import('ts-jest').JestConfigWithTsJest} **/
export default {
  // preset: 'ts-jest',
  // testEnvironment: "node",
  // transform: {
  //   "^.+.tsx?$": ["ts-jest",{}],
  // },
  testEnvironment: "jest-environment-jsdom",
  transform: {
    '^.+.tsx?$': ['ts-jest', { tsconfig: 'tsconfig.app.json' }],
  },
  setupFileAfterEnv: ["./jest.setup.ts"]
};
