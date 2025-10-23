# Scheduled Tasks & Dependency Updates - Assignment

## Assignment 3 & 4: Automated Workflows

---

## 📅 Workflow 3: Scheduled Tasks

**File**: `.github/workflows/scheduled-tasks.yml`

### Schedule:
- **Daily Maintenance**: Runs every day at 2:00 AM UTC
- **Weekly Backup**: Runs every Sunday at 2:00 AM UTC
- **Manual Trigger**: Can be run anytime via Actions tab

### Tasks Performed:

#### Daily Maintenance:
1. ✅ **Dependency Check** - Checks for outdated packages
2. ✅ **Security Audit** - Scans for vulnerabilities
3. ✅ **Cleanup** - Removes temporary files
4. ✅ **Disk Usage Check** - Monitors storage
5. ✅ **Generate Report** - Creates maintenance log
6. ✅ **Notifications** - Shows completion status

#### Weekly Backup:
1. ✅ **Creates Backup** - Backs up public files
2. ✅ **Uploads Artifact** - Stores backup for 30 days
3. ✅ **Notification** - Confirms backup success

### Cron Schedule Explained:
```yaml
'0 2 * * *'    # Daily at 2:00 AM UTC
'0 2 * * 0'    # Weekly on Sunday at 2:00 AM UTC
```

---

## 🔄 Workflow 4: Dependency Updates

**File**: `.github/workflows/dependency-updates.yml`

### Schedule:
- **Weekly Check**: Every Monday at 9:00 AM UTC
- **Manual Trigger**: Can be run anytime via Actions tab

### Process Flow:

#### Step 1: Check Updates
1. ✅ Scans for outdated dependencies
2. ✅ Creates JSON report of outdated packages
3. ✅ Displays update list
4. ✅ Uploads report as artifact (90 days retention)

#### Step 2: Security Updates
1. ✅ Applies security fixes automatically
2. ✅ Runs tests to verify compatibility
3. ✅ Creates Pull Request if updates found
4. ✅ Provides detailed PR description

### PR Creation:
When security updates are available:
- ✅ Automatic Pull Request created
- ✅ Clear title: "🔒 Security Updates - Dependency Updates"
- ✅ Detailed description with checklist
- ✅ Tests must pass before merging
- ✅ Auto-deletes branch after merge

### Versioning Policy:
- **Security fixes**: Auto-applied via `npm audit fix`
- **Breaking changes**: Manual review required
- **Tests**: Must pass before PR creation
- **Review**: PR requires approval before merge

---

## 🧪 Testing the Workflows

### Test Scheduled Tasks:
```bash
# Go to GitHub Repository
1. Actions → Scheduled Tasks
2. Click "Run workflow"
3. Select branch: main
4. Click "Run workflow"
```

### Test Dependency Updates:
```bash
# Go to GitHub Repository
1. Actions → Dependency Updates
2. Click "Run workflow"
3. Select branch: main
4. Click "Run workflow"
```

---

## 📊 Notifications & Logs

### Where to View:
1. **GitHub Actions Tab** - Real-time execution logs
2. **Artifacts** - Stored reports and backups
3. **Pull Requests** - Dependency update PRs

### Log Information:
- ✅ **Execution time** - When workflow ran
- ✅ **Tasks completed** - What was done
- ✅ **Results** - Success/failure status
- ✅ **Next run time** - Scheduled time shown

---

## 🔔 Notifications

### Automatic Notifications:
- ✅ **Email** - GitHub sends email on workflow failure
- ✅ **PR Created** - Notification when dependency PR is created
- ✅ **Console Logs** - Detailed logs in Actions tab

### Notification Settings:
Go to: `Settings → Notifications → Actions`
- ☑️ Workflow run failures
- ☑️ Pull request reviews

---

## 📦 Artifacts

### Scheduled Tasks Artifacts:
- **Weekly Backup**: Stored for 30 days
- **Location**: Actions → Workflow Run → Artifacts
- **Download**: Click artifact name to download

### Dependency Updates Artifacts:
- **Dependency Report**: JSON file with outdated packages
- **Retention**: 90 days
- **Location**: Actions → Workflow Run → Artifacts

---

## 🛠️ Maintenance Commands

### View Scheduled Workflows:
```bash
# All scheduled workflows
https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/actions

# Filter by workflow
Actions → Select workflow from left sidebar
```

### Manual Execution:
Both workflows can be triggered manually:
1. Go to Actions tab
2. Select workflow
3. Click "Run workflow"
4. Choose branch and run

---

## ⏰ Schedule Reference

### Cron Syntax:
```
* * * * *
│ │ │ │ │
│ │ │ │ └─── Day of week (0-6, Sunday=0)
│ │ │ └───── Month (1-12)
│ │ └─────── Day of month (1-31)
│ └───────── Hour (0-23)
└─────────── Minute (0-59)
```

### Common Schedules:
- `0 2 * * *` - Daily at 2:00 AM
- `0 9 * * 1` - Every Monday at 9:00 AM
- `0 0 * * 0` - Every Sunday at midnight
- `0 */6 * * *` - Every 6 hours

---

## ✅ Assignment Requirements Met

### Scheduled Tasks (Assignment 3):
✅ Predefined schedule (daily/weekly)  
✅ Maintenance tasks automated  
✅ Backups performed weekly  
✅ Specific commands executed  
✅ Notifications and logs provided  

### Dependency Updates (Assignment 4):
✅ Monitors dependencies for updates  
✅ Automated update mechanism  
✅ Creates pull requests  
✅ Runs tests for compatibility  
✅ Follows versioning policies  
✅ Includes review mechanism (PR approval)  

---

## 🔍 Troubleshooting

### Workflow not running?
- Check schedule syntax in YAML
- Verify workflow is enabled
- Wait for scheduled time

### No Pull Request created?
- Check if updates are available
- Verify permissions are set
- Look for errors in workflow logs

### Tests failing?
- Review dependency changes
- Check for breaking changes
- Update tests if needed

---

**Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2  
**Workflows**: `.github/workflows/`  
**Date**: October 2025

