# Continuous Integration Assignment - CLO 4

**Student**: Muneeb Azam  
**Assignment**: Continuous Integration Setup using GitHub Actions  
**Project**: Heavens Above - Satellite Tracking Application

---

## Assignment Requirement

Set up a GitHub Actions workflow to perform continuous integration that:
- Triggers on every push to the main branch
- Runs tests, linting, and relevant checks
- Provides clear feedback on success or failure

## Implementation

### 1. GitHub Actions Workflow

**File**: `.github/workflows/ci.yml`

**Trigger**: Runs on every push to the `main` branch

**Jobs**: Single CI job that runs sequentially:
1. **Checkout** - Gets the code from repository
2. **Setup Node.js** - Installs Node.js v18
3. **Install Dependencies** - Installs npm packages
4. **Run Linting** - Checks code quality with ESLint
5. **Run Tests** - Executes test suite
6. **Build Project** - Builds the application
7. **Report Results** - Shows clear success/failure messages

### 2. Code Quality Checks

#### Linting (ESLint)
- **Command**: `npm run lint`
- **Purpose**: Enforces code style and catches errors
- **Configuration**: `eslint.config.js`
- **Rules**: Tab indentation, double quotes, semicolons, no unused variables

#### Testing
- **Command**: `npm test`
- **Purpose**: Validates functionality
- **Tests Include**:
  - File structure validation
  - Package.json validation
  - Utils module tests
  - Satellite module tests
  - Iridium module tests

#### Build
- **Command**: `npm run build`
- **Purpose**: Ensures project builds successfully
- **Action**: Runs the main application script

### 3. Clear Feedback Mechanism

The workflow provides clear feedback through:

✅ **Success Indicators**:
- Green checkmarks for each passing step
- Final message: "✅ All checks passed successfully!"
- GitHub Actions shows green badge

❌ **Failure Indicators**:
- Red X marks for failing steps
- Detailed error logs for each failure
- Final message: "❌ Some checks failed. Please review the logs above."
- GitHub Actions shows red badge
- Workflow stops at first failure

### 4. Workflow Execution Flow

```
┌─────────────────────────────────┐
│  Push to main branch            │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  1. Checkout Repository         │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  2. Setup Node.js (v18)         │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  3. Install Dependencies        │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  4. Run Linting (ESLint)        │
│     ✅ Pass → Continue           │
│     ❌ Fail → Stop & Report     │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  5. Run Tests                   │
│     ✅ Pass → Continue           │
│     ❌ Fail → Stop & Report     │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  6. Build Project               │
│     ✅ Pass → Continue           │
│     ❌ Fail → Stop & Report     │
└──────────────┬──────────────────┘
               │
               ↓
┌─────────────────────────────────┐
│  7. Report Final Status         │
│     ✅ All checks passed!        │
│     ❌ Some checks failed!       │
└─────────────────────────────────┘
```

## How to View CI Results

1. **Go to GitHub Repository**: `https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2`
2. **Click "Actions" Tab**: View all workflow runs
3. **Select a Workflow Run**: See detailed execution
4. **Check Each Step**: View logs and results
5. **Badge Status**: Green (✅ passing) or Red (❌ failing)

## Local Testing

Before pushing to GitHub, test locally:

```bash
# Test linting
npm run lint

# Test functionality
npm test

# Test build
npm run build

# Run all checks
npm run lint && npm test && npm run build
```

## Key Features

✅ **Automated Quality Checks** - Runs automatically on every push  
✅ **Fast Feedback** - Results in ~1-2 minutes  
✅ **Fail-Fast** - Stops at first error to save time  
✅ **Clear Messages** - Easy to understand success/failure  
✅ **Version Control Integration** - Uses GitHub Actions  
✅ **Prevents Bad Code** - Catches issues before deployment  

## Technologies Used

- **GitHub Actions** - CI/CD automation platform
- **Node.js v18** - JavaScript runtime
- **ESLint 9.x** - Code linting tool
- **npm** - Package manager
- **Ubuntu Latest** - CI runner environment

## Assignment Completion Status

✅ **Requirement 1**: GitHub Actions workflow created  
✅ **Requirement 2**: Triggers on push to main branch  
✅ **Requirement 3**: Runs tests, linting, and build checks  
✅ **Requirement 4**: Provides clear success/failure feedback  

---

**Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2  
**Workflow File**: `.github/workflows/ci.yml`  
**Date**: October 23, 2025

