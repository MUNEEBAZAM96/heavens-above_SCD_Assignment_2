const globals = require("globals");

module.exports = [
	{
		ignores: [
			"**/node_modules/**",
			"**/public/data/**",
			"**/docs/**",
			"**/*.min.js",
			"eslint.config.js"
		]
	},
	{
		files: ["**/*.js"],
		languageOptions: {
			ecmaVersion: 2018,
			sourceType: "commonjs",
			globals: {
				...globals.node,
				...globals.browser,
				...globals.es2017
			}
		},
		rules: {
			"indent": ["error", "tab", { "SwitchCase": 1 }],
			"linebreak-style": ["error", "unix"],
			"quotes": ["warn", "double", { "allowTemplateLiterals": true }],
			"semi": ["error", "always"],
			"no-unused-vars": ["warn", { "argsIgnorePattern": "^_", "varsIgnorePattern": "^_" }],
			"no-console": "off",
			"no-var": "warn",
			"prefer-const": "warn",
			"no-trailing-spaces": "error",
			"eol-last": ["error", "always"],
			"comma-dangle": ["error", "never"],
			"object-curly-spacing": ["error", "always"],
			"array-bracket-spacing": ["error", "never"],
			"space-before-function-paren": ["error", "never"],
			"keyword-spacing": ["error", { "before": true, "after": true }],
			"space-infix-ops": "error",
			"no-multiple-empty-lines": ["error", { "max": 2, "maxEOF": 1 }],
			"no-mixed-spaces-and-tabs": "error",
			"no-undef": "error",
			"no-unreachable": "error",
			"no-duplicate-case": "error",
			"no-empty": "warn",
			"no-extra-semi": "error",
			"no-func-assign": "error",
			"no-invalid-regexp": "error",
			"no-irregular-whitespace": "error",
			"no-obj-calls": "error",
			"no-regex-spaces": "error",
			"no-sparse-arrays": "error",
			"no-unexpected-multiline": "error",
			"valid-typeof": "error",
			"no-constant-condition": "warn",
			"no-redeclare": "error",
			"no-dupe-keys": "error"
		}
	}
];
