// test.js
const assert = require("assert");
const fs = require("fs");
const path = require("path");

// Test utilities module
function testUtils() {
	console.log("Testing utils module...");

	try {
		const utils = require("./src/utils");

		// Test getTimestamp function
		const timestamp = utils.getTimestamp("12:30:45");
		assert.strictEqual(timestamp, 12 * 3600 + 30 * 60 + 45, "getTimestamp should calculate seconds correctly");

		// Test md5 function
		const hash = utils.md5("test");
		assert.strictEqual(typeof hash, "string", "md5 should return a string");
		assert.strictEqual(hash.length, 32, "md5 hash should be 32 characters long");

		// Test get_options function
		const options = utils.get_options("test");
		assert.strictEqual(typeof options, "object", "get_options should return an object");
		assert.strictEqual(options.method, "GET", "get_options should use GET method");

		console.log("✓ Utils module tests passed");
		return true;
	} catch (error) {
		console.error("✗ Utils module tests failed:", error.message);
		return false;
	}
}

// Test satellite module
function testSatellite() {
	console.log("Testing satellite module...");

	try {
		const satellite = require("./src/satellite");

		// Test that getTable function exists
		assert.strictEqual(typeof satellite.getTable, "function", "getTable should be a function");

		console.log("✓ Satellite module tests passed");
		return true;
	} catch (error) {
		console.error("✗ Satellite module tests failed:", error.message);
		return false;
	}
}

// Test iridium module
function testIridium() {
	console.log("Testing iridium module...");

	try {
		const iridium = require("./src/iridium");

		// Test that getTable function exists
		assert.strictEqual(typeof iridium.getTable, "function", "getTable should be a function");

		console.log("✓ Iridium module tests passed");
		return true;
	} catch (error) {
		console.error("✗ Iridium module tests failed:", error.message);
		return false;
	}
}

// Test package.json
function testPackageJson() {
	console.log("Testing package.json...");

	try {
		const packagePath = path.join(__dirname, "package.json");
		const packageJson = JSON.parse(fs.readFileSync(packagePath, "utf8"));

		// Test required fields
		assert.strictEqual(typeof packageJson.name, "string", "package.json should have a name");
		assert.strictEqual(typeof packageJson.version, "string", "package.json should have a version");
		assert.strictEqual(typeof packageJson.main, "string", "package.json should have a main field");

		// Test scripts
		assert.strictEqual(typeof packageJson.scripts, "object", "package.json should have scripts");
		assert.strictEqual(typeof packageJson.scripts.start, "string", "package.json should have start script");
		assert.strictEqual(typeof packageJson.scripts.test, "string", "package.json should have test script");
		assert.strictEqual(typeof packageJson.scripts.lint, "string", "package.json should have lint script");

		console.log("✓ Package.json tests passed");
		return true;
	} catch (error) {
		console.error("✗ Package.json tests failed:", error.message);
		return false;
	}
}

// Test file structure
function testFileStructure() {
	console.log("Testing file structure...");

	try {
		const requiredFiles = [
			"package.json",
			"run.js",
			"src/satellite.js",
			"src/utils.js",
			"src/iridium.js"
		];

		for (const file of requiredFiles) {
			const filePath = path.join(__dirname, file);
			assert.strictEqual(fs.existsSync(filePath), true, `Required file ${file} should exist`);
		}

		console.log("✓ File structure tests passed");
		return true;
	} catch (error) {
		console.error("✗ File structure tests failed:", error.message);
		return false;
	}
}

// Run all tests
function runTests() {
	console.log("Starting test suite...\n");

	const tests = [
		testFileStructure,
		testPackageJson,
		testUtils,
		testSatellite,
		testIridium
	];

	let passed = 0;
	let failed = 0;

	for (const test of tests) {
		if (test()) {
			passed++;
		} else {
			failed++;
		}
		console.log(""); // Add spacing between tests
	}

	console.log("Test Results:");
	console.log(`✓ Passed: ${passed}`);
	console.log(`✗ Failed: ${failed}`);
	console.log(`Total: ${passed + failed}`);

	if (failed > 0) {
		console.log("\nSome tests failed. Exiting with code 1.");
		process.exit(1);
	} else {
		console.log("\nAll tests passed! Exiting with code 0.");
		process.exit(0);
	}
}

// Run the tests
runTests();
