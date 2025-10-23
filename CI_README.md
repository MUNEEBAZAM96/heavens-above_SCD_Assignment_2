# Continuous Integration Setup - Assignment

## Student Information
- **Name**: Muneeb Azam
- **Assignment**: CLO 4 - Continuous Integration using GitHub Actions
- **Project**: Heavens Above Satellite Tracker

---

## Assignment Requirement Met ✅

**Task**: Set up a GitHub Actions workflow to perform continuous integration

**Requirements**:
1. ✅ Triggers on every push to the main branch
2. ✅ Runs tests, linting, and relevant checks
3. ✅ Provides clear feedback on success or failure

---

## Implementation

### Workflow File: `.github/workflows/ci.yml`

**Workflow Name**: Continuous Integration

**Trigger**: Runs automatically on push to `main` branch

**Steps**:
1. **Checkout Repository** - Gets the latest code
2. **Setup Node.js** - Installs Node.js v18
3. **Install Dependencies** - Installs required packages
4. **Run Linting** - Checks code quality using ESLint
5. **Run Tests** - Executes automated tests
6. **Build Project** - Validates project structure
7. **Report Status** - Shows success ✅ or failure ❌ message

---

## Checks Performed

### 1. Linting (ESLint)
- **Command**: `npm run lint`
- **Purpose**: Enforces code style and quality standards
- **What it checks**:
  - Code formatting (indentation, quotes, semicolons)
  - Unused variables
  - Syntax errors
  - Best practices

### 2. Testing
- **Command**: `npm test`
- **Purpose**: Validates functionality
- **Tests**:
  - File structure validation
  - Package.json validation  
  - Utils module functionality
  - Satellite module functionality
  - Iridium module functionality

### 3. Build Validation
- **Command**: `npm run build`
- **Purpose**: Ensures project is properly configured

---

## Clear Feedback Mechanism

### ✅ Success Feedback:
- All steps show green checkmarks (✓)
- Final message: **"✅ All checks passed successfully!"**
- GitHub Actions badge shows **green**
- Commit status shows **passing**

### ❌ Failure Feedback:
- Failed steps show red X marks (✗)
- Detailed error messages in logs
- Final message: **"❌ Some checks failed. Please review the logs above."**
- GitHub Actions badge shows **red**
- Commit status shows **failing**
- Workflow stops at first failure

---

## How to View CI Results

1. Visit: `https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/actions`
2. Click on latest workflow run
3. View detailed logs for each step
4. Check success/failure status

---

## Local Testing

Test before pushing to GitHub:

```bash
# Run linting
npm run lint

# Run tests
npm test

# Run build
npm run build

# Run all checks
npm run ci
```

---

## Technologies Used

- **CI Platform**: GitHub Actions
- **Runtime**: Node.js 18
- **Linter**: ESLint 9.x
- **Package Manager**: npm
- **OS**: Ubuntu (Latest)

---

## Assignment Completion ✅

✅ **GitHub Actions workflow created and working**  
✅ **Triggers automatically on push to main branch**  
✅ **Runs tests, linting, and build checks**  
✅ **Provides clear success/failure feedback**  
✅ **Version control integration complete**

---

**Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2  
**Date**: October 2025

