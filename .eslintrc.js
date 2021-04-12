module.exports = {
  env: {
    browser: true,
    es6: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
  ],
  globals: {
    g: true,
  },
  parserOptions: {
    sourceType: "module",
  },
  plugins: [
    'eslint-plugin-babel',
  ],
  rules: {
    "no-unused-vars": ["error", { varsIgnorePattern: "ignore", args: "none"}],
    "no-constant-condition": ["error", { checkLoops: false }],
  },
  root: true,
  settings: {
    react: {version: "999.999.999"}
  }
};
