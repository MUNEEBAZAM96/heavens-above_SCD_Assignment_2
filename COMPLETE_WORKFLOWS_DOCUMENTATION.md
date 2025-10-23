# Complete GitHub Actions Workflows Documentation

**Project**: Heavens Above - Satellite Tracking Application  
**Student**: Muneeb Azam  
**Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2

---

## Table of Contents

1. [Workflow 1: Continuous Integration](#workflow-1-continuous-integration)
2. [Workflow 2: Deployment Pipeline](#workflow-2-deployment-pipeline)
3. [Workflow 3: Scheduled Tasks](#workflow-3-scheduled-tasks)
4. [Workflow 4: Dependency Updates](#workflow-4-dependency-updates)
5. [Workflow 5: Code Review](#workflow-5-code-review)
6. [Workflow 6: Documentation Deployment](#workflow-6-documentation-deployment)
7. [Workflow 7: Custom Workflow](#workflow-7-custom-workflow)
8. [How to Interpret Results](#how-to-interpret-results)

---

## Workflow 1: Continuous Integration

### Purpose
Automates code quality checks, testing, and building on every push to the main branch to ensure code integrity.

### File Location
`.github/workflows/ci.yml`

### Configuration

**Trigger:**
```yaml
on:
  push:
    branches: [main]
```
- Runs automatically when code is pushed to the main branch

**Jobs:**
1. **CI Job** - Single job that runs all checks

**Steps:**
1. Checkout repository
2. Setup Node.js v18
3. Install dependencies (`npm install`)
4. Run linting (`npm run lint`)
5. Run tests (`npm test`)
6. Build project (`npm run build`)
7. Report success/failure

**Permissions:**
- `contents: read` - Read access to repository code
- No write permissions needed

### How to Interpret Results

**Success (✅):**
```
✅ All checks passed successfully!
```
- All steps completed without errors
- Code meets quality standards
- Tests are passing
- Project builds successfully

**Failure (❌):**
```
❌ Some checks failed. Please review the logs above.
```
- Check which step failed (red X mark)
- Read error message in that step
- Common failures:
  - **Linting failed**: Code style errors (fix with `npm run lint:fix`)
  - **Tests failed**: Functionality broken (check test output)
  - **Build failed**: Syntax errors or missing files

**Where to View:**
- Go to: Actions tab → Continuous Integration
- Click on the latest run
- Expand each step to see details

**Example Output:**
```
Run npm run lint
✅ 0 errors, 0 warnings

Run npm test
✅ 5/5 tests passed

Run npm run build
✅ Build step - Project validated successfully
```

---

## Workflow 2: Deployment Pipeline

### Purpose
Automates building and deploying the web application to GitHub Pages hosting platform.

### File Location
`.github/workflows/deploy.yml`

### Configuration

**Trigger:**
```yaml
on:
  push:
    branches: [main]
  workflow_dispatch:
```
- Runs on push to main
- Can be triggered manually via Actions tab

**Concurrency:**
```yaml
concurrency:
  group: "pages"
  cancel-in-progress: true
```
- Only one deployment runs at a time
- Cancels old deployments when new one starts

**Jobs:**

#### Job 1: Build and Deploy
1. **Checkout** - Get source code
2. **Setup Node.js** - Install Node.js 18
3. **Install dependencies** - `npm install`
4. **Run linting** - Quality check
5. **Run tests** - Functionality check
6. **Build project** - Validate project
7. **Setup Pages** - Configure GitHub Pages
8. **Prepare files** - Copy public files to `_site/`
9. **Upload artifact** - Package deployment files
10. **Deploy** - Push to GitHub Pages
11. **Success message** - Show deployment URL

**Permissions:**
- `contents: write` - Deploy to repository
- `pages: write` - Write to GitHub Pages
- `id-token: write` - Authentication

**Environment:**
- `github-pages` - Protected deployment environment

### How to Interpret Results

**Success (✅):**
```
================================================
✅ DEPLOYMENT SUCCESSFUL!
🌐 Your website is live at:
https://muneebazam96.github.io/heavens-above_SCD_Assignment_2/
================================================
```
- Website is now live and accessible
- All quality checks passed before deployment
- Files uploaded to GitHub Pages successfully

**Failure (❌):**

**If build fails:**
- Check linting or test errors
- Fix issues and push again

**If deployment fails:**
- Verify GitHub Pages is enabled (Settings → Pages → Source: GitHub Actions)
- Check permissions are correct
- Look for "Not Found" or "Forbidden" errors

**Where to View:**
1. **Workflow Status**: Actions tab → Deployment Pipeline
2. **Live Website**: Visit the URL shown in success message
3. **Deployment Logs**: Click on workflow run → Deploy step

**Example Successful Run:**
```
Step 1: Checkout ✅
Step 2: Setup Node.js ✅
Step 3: Install dependencies ✅
Step 4: Run linting ✅ (0 errors)
Step 5: Run tests ✅ (5/5 passed)
Step 6: Build project ✅
Step 7: Setup Pages ✅
Step 8: Prepare files ✅
Step 9: Upload artifact ✅
Step 10: Deploy ✅
Step 11: Show URL ✅
```

---

## Workflow 3: Scheduled Tasks

### Purpose
Automates routine maintenance tasks and backups on a scheduled basis to keep the project healthy.

### File Location
`.github/workflows/scheduled-tasks.yml`

### Configuration

**Triggers:**
```yaml
on:
  schedule:
    - cron: '0 2 * * *'     # Daily at 2:00 AM UTC
  workflow_dispatch:         # Manual trigger
```

**Schedule Breakdown:**
- `'0 2 * * *'` - Every day at 2:00 AM UTC
- Format: `minute hour day month weekday`

**Jobs:**

#### Job 1: Daily Maintenance
**Purpose**: Perform daily system checks and cleanup

**Steps:**
1. **Checkout repository** - Get latest code
2. **Setup Node.js** - Install runtime
3. **Install dependencies** - Install packages
4. **Check outdated dependencies** - Run `npm outdated`
5. **Security audit** - Run `npm audit`
6. **Clean artifacts** - Remove temporary files
7. **Check disk usage** - Monitor storage
8. **Generate report** - Create maintenance log
9. **Notify completion** - Show summary

**Output:**
```
🔍 Checking for outdated dependencies...
✅ Dependency check complete

🔒 Running security audit...
✅ Security audit complete

🧹 Cleaning temporary files...
✅ Cleanup complete

💾 Checking disk usage...
✅ Disk check complete

📊 Generating maintenance report...
✅ Report generated successfully
```

#### Job 2: Weekly Backup
**Purpose**: Create weekly backup of important files

**Schedule**: Runs only on Sundays at 2:00 AM UTC

**Steps:**
1. **Checkout repository** - Get files
2. **Create backup** - Copy public folder
3. **Upload artifact** - Store backup for 30 days
4. **Notify** - Confirm backup success

**Output:**
```
💾 Creating weekly backup...
✅ Backup created

📦 Backup stored as artifact
🕐 Retention: 30 days
```

### How to Interpret Results

**Daily Maintenance Results:**

**Success:**
```
✅ SCHEDULED MAINTENANCE COMPLETED
📅 Date: [timestamp]
⏰ Next run: Tomorrow at 2:00 AM UTC
```

**Check for:**
- Outdated dependencies (warnings to update)
- Security vulnerabilities (action needed if found)
- Disk space issues (warnings if low)

**Weekly Backup Results:**

**Success:**
```
✅ WEEKLY BACKUP COMPLETED
📦 Backup stored as artifact
🕐 Retention: 30 days
```

**Accessing Backups:**
1. Go to Actions tab
2. Click on "Scheduled Tasks" workflow
3. Select a run that created backup
4. Scroll to "Artifacts" section
5. Download: `weekly-backup-[number]`

**Manual Execution:**
1. Actions tab → Scheduled Tasks
2. Click "Run workflow"
3. Select branch: main
4. Click "Run workflow" button

---

## Workflow 4: Dependency Updates

### Purpose
Monitors project dependencies weekly and automatically creates pull requests for security updates.

### File Location
`.github/workflows/dependency-updates.yml`

### Configuration

**Trigger:**
```yaml
on:
  schedule:
    - cron: '0 9 * * 1'    # Every Monday at 9:00 AM UTC
  workflow_dispatch:        # Manual trigger
```

**Permissions:**
- `contents: write` - Create commits
- `pull-requests: write` - Create PRs

**Jobs:**

#### Job 1: Check Updates
**Purpose**: Scan for outdated dependencies

**Steps:**
1. **Checkout repository**
2. **Setup Node.js**
3. **Install dependencies**
4. **Check outdated packages** - `npm outdated`
5. **Display outdated** - Show update list
6. **Create report** - Generate JSON report
7. **Upload artifact** - Store report (90 days)

**Output:**
```
🔍 Checking for outdated dependencies...
📦 Found outdated dependencies

📋 Outdated Dependencies:
[package]@[current] → [latest]
```

#### Job 2: Security Updates
**Purpose**: Apply security fixes and create PR

**Steps:**
1. **Checkout repository**
2. **Setup Node.js**
3. **Install dependencies**
4. **Apply fixes** - `npm audit fix`
5. **Run tests** - Verify compatibility
6. **Check changes** - Detect if updates applied
7. **Create Pull Request** - If changes exist

**PR Content:**
```
Title: 🔒 Security Updates - Dependency Updates

Body:
## 🔒 Automated Security Updates

This PR contains automated security updates.

### Changes:
- Applied `npm audit fix`
- All tests passing ✅

### Review Checklist:
- [ ] Review dependency changes
- [ ] Verify tests pass
- [ ] Check for breaking changes
```

### How to Interpret Results

**No Updates Needed:**
```
✅ All dependencies up to date
✅ DEPENDENCY UPDATE CHECK COMPLETED
```
- No action required
- All packages are current

**Updates Available:**
```
📦 Found outdated dependencies
✅ Pull Request created

PR #[number]: Security Updates - Dependency Updates
```

**Actions to Take:**
1. **Review the PR**:
   - Check which dependencies changed
   - Read changelog for breaking changes
   - Verify tests passed

2. **Approve or Request Changes**:
   - If safe: Approve and merge
   - If unsure: Request team review
   - If broken: Close PR and investigate

**Accessing Reports:**
1. Actions tab → Dependency Updates
2. Click workflow run
3. Scroll to "Artifacts"
4. Download: `dependency-report-[number]`
5. Open JSON file to see details

**Example Report Contents:**
```json
{
  "package-name": {
    "current": "1.0.0",
    "wanted": "1.0.5",
    "latest": "2.0.0"
  }
}
```

---

## Workflow 5: Code Review

### Purpose
Automates code quality checks, security scans, and provides feedback on all pull requests.

### File Location
`.github/workflows/code-review.yml`

### Configuration

**Trigger:**
```yaml
on:
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
```
- Runs when PR is created
- Runs when commits are pushed to PR
- Runs when PR is reopened

**Permissions:**
- `contents: read` - Read code
- `pull-requests: write` - Post comments
- `issues: write` - Update PR
- `checks: write` - Set status

**Jobs:**

#### Job 1: Code Standards Check
**Purpose**: Enforce coding style and standards

**Steps:**
1. Checkout code
2. Setup Node.js
3. Install dependencies
4. Run ESLint
5. Save results to file
6. Post comment on PR
7. Fail if errors found

**Comment Example:**
```markdown
## 📋 Code Standards Check

✅ No errors found!
```

#### Job 2: Code Quality Analysis
**Purpose**: Analyze code quality metrics

**Steps:**
1. Checkout code
2. Setup Node.js
3. Install dependencies
4. Run tests with coverage
5. Analyze complexity
6. Post metrics comment

**Comment Example:**
```markdown
## 📊 Code Quality Metrics

✅ Tests: All tests passed
📈 Code Analysis: Completed
🔍 Files Checked: 3 JavaScript files

### Recommendations:
- Maintain test coverage
- Keep functions small and focused
```

#### Job 3: Security Scan
**Purpose**: Find security vulnerabilities

**Steps:**
1. Checkout code
2. Setup Node.js
3. Install dependencies
4. Run npm audit
5. Categorize vulnerabilities
6. Post security report

**Comment Example:**
```markdown
## 🔒 Security Scan Results

✅ No vulnerabilities detected!

**Vulnerability Summary:**
- Critical: 0
- High: 0
- Moderate: 0
- Low: 0

**Status:** All dependencies are secure
```

#### Job 4: PR Review Summary
**Purpose**: Consolidate all results

**Steps:**
1. Wait for all checks
2. Create summary table
3. Provide next steps
4. Set final status

**Comment Example:**
```markdown
## ✅ Code Review Summary

| Check | Status |
|-------|--------|
| Code Standards | ✅ success |
| Code Quality | ✅ success |
| Security Scan | ✅ success |

### ✅ All checks passed! This PR is ready for review.

**Next Steps:**
- Request review from team members
- Address any review comments
- Merge when approved
```

### How to Interpret Results

**All Checks Passed (✅):**
- PR is ready for human review
- Code meets quality standards
- No security issues
- Tests are passing
- Can proceed to merge (after approval)

**Some Checks Failed (❌):**

**If Code Standards Failed:**
```
⚠️ Please fix linting errors
```
- Run `npm run lint` locally
- Run `npm run lint:fix` to auto-fix
- Push changes

**If Tests Failed:**
```
❌ Tests: 3/5 passed
```
- Check which tests failed
- Fix the broken functionality
- Push updated code

**If Security Issues Found:**
```
⚠️ Vulnerabilities found
- Critical: 1
- High: 2

**Action Required:** Please run `npm audit fix`
```
- Run `npm audit fix` locally
- Review and test changes
- Push updated package files

**Where to View:**
1. **PR Page**: All comments posted directly on PR
2. **Checks Tab**: Status of each check
3. **Files Changed**: See what triggered issues

---

## Workflow 6: Documentation Deployment

### Purpose
Automatically builds and deploys project documentation whenever documentation files are updated.

### File Location
`.github/workflows/docs-deployment.yml`

### Configuration

**Trigger:**
```yaml
on:
  push:
    branches: [main]
    paths:
      - 'docs/**'
      - '*.md'
      - 'README.md'
  workflow_dispatch:
```
- Runs when documentation files change
- Runs when README files are updated
- Can be triggered manually

**Permissions:**
- `contents: write` - Modify repository
- `pages: write` - Deploy to Pages
- `id-token: write` - Authentication

**Jobs:**

#### Job 1: Build Documentation
**Purpose**: Generate HTML documentation from source files

**Steps:**
1. **Checkout repository** - Get source files
2. **Setup Node.js** - Install environment
3. **Create structure** - Build docs folders
4. **Generate index** - Create main documentation page
5. **Convert files** - Transform Markdown to HTML
6. **Generate sitemap** - Create SEO sitemap
7. **Upload artifact** - Save documentation (90 days)

**Generated Files:**
```
docs/build/
├── index.html          # Main documentation page
├── workflows/          # Workflow documentation
│   ├── ci.html
│   ├── deploy.html
│   └── ...
├── guides/             # User guides
└── sitemap.xml         # SEO sitemap
```

**Output:**
```
📚 Building documentation...
📄 Converting documentation files...
✅ DOCUMENTATION BUILD COMPLETED
📚 Files generated successfully
```

#### Job 2: Deploy Documentation
**Purpose**: Make documentation accessible online

**Steps:**
1. Download built documentation
2. Create deployment info
3. Show deployment confirmation

**Output:**
```
✅ DOCUMENTATION DEPLOYED
🌐 Access documentation at:
   https://muneebazam96.github.io/heavens-above_SCD_Assignment_2/
📖 Documentation is now live and accessible
🔄 Auto-updates on every commit to docs/
```

### How to Interpret Results

**Success:**
```
✅ Files generated: [count]
✅ Documentation deployed
🌐 Live at: [URL]
```
- Documentation is now accessible
- Auto-generated HTML pages created
- Searchable and organized

**Accessing Documentation:**
1. **Live URL**: Visit deployment URL shown in logs
2. **Artifacts**: Download built docs from workflow run
3. **Structure**: Browse organized documentation

**Updating Documentation:**
1. Edit any `.md` file or files in `docs/`
2. Commit and push changes
3. Workflow automatically rebuilds
4. Documentation updates in ~1-2 minutes

**Example Documentation Page:**
```
Heavens Above Documentation
├── CI/CD Workflows
├── Scheduled Tasks
├── Dependency Updates
├── Code Review
├── Documentation
└── Custom Workflows
```

---

## Workflow 7: Custom Workflow (Release & Analytics)

### Purpose
Automates release note generation and performance analytics tracking for the project.

### File Location
`.github/workflows/custom-workflow.yml`

### Configuration

**Triggers:**
```yaml
on:
  push:
    tags:
      - 'v*'              # On version tags
  workflow_dispatch:       # Manual with inputs
    inputs:
      generate_release: bool
      analyze_metrics: bool
```

**Trigger Methods:**
1. **Automatic**: Push a version tag (e.g., `v1.0.0`)
2. **Manual**: Run from Actions tab with options

**Permissions:**
- `contents: write` - Create releases
- `issues: write` - Post comments
- `pull-requests: read` - Read PR data

**Jobs:**

#### Job 1: Generate Release Notes
**Purpose**: Auto-generate comprehensive release notes

**Steps:**
1. **Checkout with history** - Get full git history
2. **Extract version** - Get version from tag or date
3. **Get commits** - Collect recent commits
4. **Analyze changes** - Count files/lines changed
5. **Generate notes** - Create formatted release notes
6. **Display notes** - Show in logs
7. **Upload artifact** - Save notes (365 days)
8. **Create GitHub Release** - Publish release on GitHub

**Release Notes Contents:**
```markdown
# Release Notes - v1.0.0

**Release Date:** October 23, 2025

## 🎉 What's New

### Features & Improvements
- ✨ Enhanced workflows
- 🔄 Automated CI/CD
- 📚 Documentation
- 🔒 Security scanning

### Workflows Included
1. Continuous Integration
2. Deployment Pipeline
3. Scheduled Tasks
4. Dependency Updates
5. Code Review
6. Documentation
7. Custom Analytics

## 📈 Metrics
- Workflows: 7
- Tests: All passing ✅
- Security: No vulnerabilities 🔒

## 🔄 Recent Changes
- [commit messages]

## 🚀 Deployment
- Live Site: [URL]
- Status: Operational ✅
```

**Output:**
```
📋 RELEASE NOTES GENERATED
✅ Release created: [URL]
```

#### Job 2: Analyze Performance Metrics
**Purpose**: Track codebase and workflow performance

**Steps:**
1. **Checkout repository**
2. **Setup Node.js**
3. **Install dependencies**
4. **Analyze codebase** - Count files, lines
5. **Workflow metrics** - Performance data
6. **Generate report** - Create metrics document
7. **Display metrics** - Show in logs
8. **Upload report** - Save (90 days)
9. **Post to issues** - Comment on latest issue

**Metrics Report Contents:**
```markdown
# Performance & Analytics Report

## 📊 Codebase Metrics
| Metric | Value |
|--------|-------|
| JavaScript Files | 15 |
| HTML Files | 5 |
| CSS Files | 3 |
| Total JS Lines | 2500 |

## 🔄 Workflow Metrics
| Workflow | Status | Avg Runtime |
|----------|--------|-------------|
| CI | ✅ Active | ~2 min |
| Deploy | ✅ Active | ~3 min |
| [etc...]

## 📈 Activity Metrics
- Total Workflows: 7
- Automation Coverage: 100%
- Average Success Rate: 95%+

## 🎯 Quality Metrics
- Test Coverage: High
- Linting: Zero errors
- Security: No vulnerabilities
- Code Quality: A+ grade
```

**Output:**
```
📊 PERFORMANCE METRICS
✅ Codebase analyzed
✅ Metrics report generated
```

#### Job 3: Sync Project Status
**Purpose**: Consolidate all custom workflow results

**Steps:**
1. Wait for other jobs
2. Create status summary
3. Display completion

**Output:**
```
🎯 CUSTOM WORKFLOW COMPLETED
✅ Release Notes: Generated
✅ Performance Metrics: Analyzed
✅ Reports: Uploaded as artifacts
```

### How to Interpret Results

**Creating a Release (Manual):**

1. **Actions Tab** → Custom Workflow
2. Click **Run workflow**
3. Select:
   - ☑️ Generate release notes: true
   - ☑️ Analyze metrics: true
4. Click **Run workflow**

**Creating a Release (Tag):**

```bash
# Create and push a version tag
git tag v1.0.0
git push origin v1.0.0

# Workflow runs automatically
```

**Success Indicators:**
```
✅ Release Notes Generated
✅ GitHub Release Created: [URL]
✅ Metrics Report Created
✅ Reports Uploaded
```

**Viewing Results:**

1. **GitHub Release**:
   - Go to repository
   - Click "Releases" (right sidebar)
   - Find your version
   - View full release notes

2. **Metrics Report**:
   - Actions → Workflow run
   - Scroll to "Artifacts"
   - Download `metrics-report-[number]`

3. **Issue Comment**:
   - Check latest open issue
   - Metrics automatically posted

**Artifacts Retention:**
- Release Notes: 365 days
- Metrics Reports: 90 days

---

## How to Interpret Results

### General Workflow Status

**Green Checkmark (✅):**
- Workflow completed successfully
- All steps passed
- No action needed

**Red X (❌):**
- Workflow failed
- Check which step failed
- Read error message
- Fix issue and retry

**Yellow Circle (🟡):**
- Workflow is running
- Wait for completion
- Usually takes 1-5 minutes

**Gray Dash (⚪):**
- Workflow was skipped
- Check if conditions met
- May be intentional

### Understanding Logs

**How to Read Workflow Logs:**

1. **Go to Actions Tab**
2. **Click on Workflow Name**
3. **Select a Run**
4. **View Jobs** (left sidebar)
5. **Click Job Name**
6. **Expand Steps** to see details

**Log Levels:**

```
ℹ️  Info: Informational messages
⚠️  Warning: Non-critical issues
❌ Error: Failures that need fixing
✅ Success: Completed successfully
```

**Common Patterns:**

```bash
# Starting a step
Run npm install

# Successful completion
✅ Dependencies installed

# Error
Error: ENOENT: no such file or directory

# Warning
⚠️  3 vulnerabilities found
```

### Artifacts

**What Are Artifacts?**
- Files generated by workflows
- Stored temporarily (retention period)
- Downloadable from workflow runs

**Types of Artifacts:**

| Artifact | Workflow | Retention | Contents |
|----------|----------|-----------|----------|
| production-files | Deploy | 7 days | Built website |
| weekly-backup | Scheduled | 30 days | Backup files |
| dependency-report | Dependencies | 90 days | Update report |
| release-notes | Custom | 365 days | Release docs |
| metrics-report | Custom | 90 days | Analytics |
| documentation | Docs | 90 days | HTML docs |

**Downloading Artifacts:**

1. Actions → Workflow run
2. Scroll to "Artifacts" section
3. Click artifact name
4. ZIP file downloads
5. Extract and view contents

### Email Notifications

**When You Receive Emails:**

**Workflow Failed:**
```
Subject: [Repo] Run failed: [Workflow] - main

Your workflow run failed.
View details: [link]
```

**Action**: Click link, check logs, fix issue

**Workflow Succeeded After Failure:**
```
Subject: [Repo] Run success: [Workflow] - main

Workflow is now passing!
```

**Managing Notifications:**

Settings → Notifications → Actions
- ☑️ Failed workflow runs
- ☐ Successful workflow runs

### Pull Request Checks

**PR Status Badges:**

```
✅ All checks have passed
   ↳ CI / build-and-test
   ↳ Code Review / code-standards
   ↳ Code Review / code-quality
   ↳ Code Review / security-scan
```

**What Each Status Means:**

- ✅ **Required** - Must pass to merge
- ⚪ **Expected** - Should run but not blocking
- ⚠️ **Skipped** - Didn't run (conditions not met)

**Merge Button States:**

```
🟢 Merge pull request
   ↳ All checks passed, safe to merge

🟡 Merge without waiting
   ↳ Checks still running, merge anyway (not recommended)

🔴 Cannot merge
   ↳ Required checks failed, fix issues first
```

### Scheduled Workflows

**Checking if Scheduled Workflows Ran:**

1. Actions → Workflow name
2. Check "Event" column
3. Look for "schedule" events
4. Verify timestamps match schedule

**If Not Running:**

- Check cron syntax
- Verify workflow is enabled
- Wait for scheduled time
- Test with manual trigger first

**Next Run Time:**

Calculate from cron expression:
- `'0 2 * * *'` = Daily at 2:00 AM UTC
- `'0 9 * * 1'` = Monday at 9:00 AM UTC

Convert to your timezone if needed.

### Troubleshooting Common Issues

**Issue: Workflow Not Triggering**

✅ Check:
- Trigger conditions match
- Workflow file in correct location (`.github/workflows/`)
- Valid YAML syntax
- Workflow is enabled

**Issue: Permission Denied**

✅ Check:
- Workflow permissions configured
- Repository settings allow Actions
- No branch protection blocking

**Issue: Tests Failing in CI but Pass Locally**

✅ Check:
- Environment differences
- Dependencies installed correctly
- Test timeouts
- File paths (case sensitivity)

**Issue: Deployment Not Working**

✅ Check:
- GitHub Pages enabled
- Source set to "GitHub Actions"
- Permissions granted
- Files in correct directory

---

## Quick Reference

### Workflow Summary Table

| # | Workflow | Trigger | Duration | Artifacts | Purpose |
|---|----------|---------|----------|-----------|---------|
| 1 | CI | Push to main | ~2 min | None | Quality checks |
| 2 | Deploy | Push to main | ~3 min | Website | Deploy app |
| 3 | Scheduled | Daily/Weekly | ~1 min | Backups | Maintenance |
| 4 | Dependencies | Weekly Mon | ~2 min | Reports | Updates |
| 5 | Code Review | Pull Request | ~3 min | None | PR checks |
| 6 | Documentation | Docs change | ~1 min | HTML | Deploy docs |
| 7 | Custom | Tag/Manual | ~2 min | Notes/Metrics | Analytics |

### Key URLs

- **Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2
- **Actions**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/actions
- **Live Site**: https://muneebazam96.github.io/heavens-above_SCD_Assignment_2/
- **Releases**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/releases

### Support

**For Workflow Issues:**
1. Check workflow logs
2. Review this documentation
3. Test locally first
4. Check GitHub Actions status

**For Assignment Questions:**
- All workflows implemented ✅
- Documentation complete ✅
- Ready for submission ✅

---

**Last Updated**: October 2025  
**Version**: 1.0  
**Status**: All workflows operational ✅

