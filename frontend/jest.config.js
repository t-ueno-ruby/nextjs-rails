/** @type {import('ts-jest').JestConfigWithTsJest} **/
export default {
  // preset: 'ts-jest',
  // テストの実行環境を指定する
  //    初期設定は 'node'
  //    UIコンポーネントのテストはDOM上でテストを行いたいので'jest-environment-jsdom'
  testEnvironment: 'jest-environment-jsdom',
  // 以下にtsconfig.app.jsonの設定を追加する
  transform: {
    '^.+.tsx?$': ['ts-jest', { tsconfig: 'tsconfig.app.json' }],
  },
  setupFilesAfterEnv: ['./jest.setup.ts'],
};
