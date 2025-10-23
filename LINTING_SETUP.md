# ESLint Setup Documentation

## Overview

This project now has ESLint properly configured and integrated into the CI/CD pipeline. The linting process runs automatically on every push and pull request to the main branch.

## Configuration Files

### `eslint.config.js`
The main ESLint configuration file using the new flat config format (required for ESLint 9.x).

**Key Features:**
- Uses flat config format compatible with ESLint 9.x
- Configured for Node.js and browser environments
- Ignores `node_modules`, `public/data`, `docs`, and minified files
- Enforces code quality rules while being practical

### Rules Enforced

#### Code Style:
- **Indentation**: Tab-based indentation
- **Quotes**: Double quotes (warnings only for flexibility)
- **Semicolons**: Required
- **Trailing Spaces**: Not allowed
- **Line Breaks**: Unix-style (LF)

#### Code Quality:
- **No undefined variables**: Prevents use of undeclared variables
- **No unused variables**: Warns about unused variables (allows `_` prefix for intentionally unused)
- **No unreachable code**: Prevents dead code
- **Prefer const**: Encourages immutability
- **No var**: Enforces modern ES6 syntax

## NPM Scripts

### Available Commands:

```bash
# Run linting with max 100 warnings allowed (CI-friendly)
npm run lint

# Auto-fix linting issues
npm run lint:fix

# Run strict linting (no warnings allowed)
npm run lint:strict

# Run full CI pipeline (lint + test + build)
npm run ci
```

## GitHub Actions Integration

### Workflow Structure

The CI workflow (`.github/workflows/ci.yml`) includes a dedicated **Lint Job** that:

1. **Runs First**: Linting runs before tests and build
2. **Fast Feedback**: Catches code quality issues early
3. **Blocks on Failure**: If linting fails, subsequent jobs don't run
4. **Multi-Step Process**:
   - Checkout code
   - Setup Node.js 18.x
   - Install dependencies with caching
   - Run ESLint

### Job Dependencies:

```
lint → test (on multiple Node versions) → build
```

## Linting Results

### Current Status: ✅ PASSING

- **Errors**: 0
- **Warnings**: 3 minor warnings
- **Status**: All critical issues fixed

### Remaining Warnings:
1. Unused `iridium` variable in `run.js`
2. Unused `location` variable in `run.js`  
3. Unused `index` parameter in `src/satellite.js`

These are non-critical and don't block the CI pipeline.

## Fixed Issues

### Major Fixes Applied:
1. ✅ Fixed undefined `options` variable in `satellite.js` and `iridium.js`
2. ✅ Fixed undefined `current` variable in `satellite.js`
3. ✅ Auto-fixed 47 errors and 66 warnings using `--fix`
   - Removed trailing spaces
   - Fixed quote inconsistencies
   - Corrected indentation
   - Added missing semicolons

## Local Development Workflow

### Before Committing:

```bash
# 1. Check for linting issues
npm run lint

# 2. Auto-fix fixable issues
npm run lint:fix

# 3. Run tests
npm test

# 4. Run full CI pipeline locally
npm run ci
```

### Viewing Detailed Lint Results:

```bash
# See full error list
npm run lint:strict

# Fix specific file
npx eslint src/satellite.js --fix
```

## CI/CD Pipeline

### When You Push Code:

1. **Lint Job** runs first (Node.js 18.x)
   - Fast feedback (~30 seconds)
   - Catches style and quality issues
   
2. **Test Job** runs if linting passes
   - Tests on Node 12.x, 14.x, 16.x, 18.x
   - Ensures compatibility
   
3. **Build Job** runs if tests pass
   - Builds the project
   - Runs security audit

### Viewing CI Results:

Go to: `https://github.com/YOUR_USERNAME/YOUR_REPO/actions`

Each job shows:
- ✅ Green checkmark: Passed
- ❌ Red X: Failed  
- 📋 Click for detailed logs

## Troubleshooting

### Common Issues:

#### 1. "eslint: command not found"
```bash
npm install
```

#### 2. Too many linting errors
```bash
# Auto-fix what can be fixed
npm run lint:fix

# Check remaining issues
npm run lint
```

#### 3. CI failing on linting
- Run `npm run lint` locally first
- Fix all errors before pushing
- Warnings are allowed (up to 100)

#### 4. Need to ignore a rule for specific line
```javascript
// eslint-disable-next-line no-console
console.log("This is OK");
```

#### 5. Need to ignore entire file
Add to `ignores` array in `eslint.config.js`

## Best Practices

1. **Run linting before committing**: Use `npm run lint`
2. **Fix errors immediately**: Don't let them accumulate
3. **Use auto-fix**: `npm run lint:fix` handles most issues
4. **Write clean code**: Follow the enforced rules
5. **Check CI status**: Ensure all checks pass after pushing

## Configuration Customization

To modify linting rules, edit `eslint.config.js`:

```javascript
rules: {
  "rule-name": "off",      // Disable rule
  "rule-name": "warn",     // Warning only
  "rule-name": "error",    // Block on error
}
```

## Resources

- [ESLint Documentation](https://eslint.org/)
- [ESLint 9.x Flat Config](https://eslint.org/docs/latest/use/configure/configuration-files)
- [GitHub Actions](https://docs.github.com/en/actions)

---

**Last Updated**: October 23, 2025  
**ESLint Version**: 9.38.0  
**Status**: ✅ Fully Configured and Working

