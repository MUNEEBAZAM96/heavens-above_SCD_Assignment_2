# Deployment Pipeline - Assignment

## Student Information
- **Name**: Muneeb Azam
- **Assignment**: Deployment Pipeline using GitHub Actions
- **Hosting Platform**: GitHub Pages
- **Project**: Heavens Above - Satellite Tracking Web Application

---

## Assignment Requirement Met ✅

**Task**: Implement a deployment pipeline using GitHub Actions

**Requirements**:
1. ✅ Automates the deployment process for a web application
2. ✅ Defines stages: Building, Testing, and Deploying
3. ✅ Deploys to hosting platform (GitHub Pages)
4. ✅ Secure deployment following best practices
5. ✅ Implements continuous delivery principles

---

## Deployment Pipeline Overview

### Workflow File: `.github/workflows/deploy.yml`

**Workflow Name**: Deployment Pipeline

**Triggers**:
- Automatically on push to `main` branch
- Manually via workflow_dispatch

**Deployment Target**: GitHub Pages (GitHub's free hosting service)

---

## Pipeline Stages

### 📦 Stage 1: BUILD
**Purpose**: Prepare the application for deployment

**Steps**:
1. **Checkout Code** - Get latest source code
2. **Setup Node.js** - Install Node.js environment
3. **Install Dependencies** - Install required packages
4. **Run Linting** - Ensure code quality
5. **Run Tests** - Validate functionality
6. **Prepare Deployment Files** - Copy production files to `dist/`
7. **Upload Artifacts** - Save build for next stages

**Security**: Uses npm ci for reproducible builds

---

### 🧪 Stage 2: TEST DEPLOYMENT
**Purpose**: Verify build artifacts before deployment

**Steps**:
1. **Download Artifacts** - Get build from previous stage
2. **Verify Files** - Check all required files exist
3. **Validate Structure** - Ensure proper file structure

**Why This Matters**: Catches issues before deployment to production

---

### 🚀 Stage 3: DEPLOY
**Purpose**: Deploy to GitHub Pages hosting

**Steps**:
1. **Download Artifacts** - Get verified build
2. **Setup GitHub Pages** - Configure Pages environment
3. **Upload to Pages** - Send files to GitHub Pages
4. **Deploy** - Publish website live
5. **Confirm Success** - Display deployment URL

**Environment**: `github-pages` (protected environment)

---

## Security Best Practices Implemented

### 1. **Least Privilege Permissions**
```yaml
permissions:
  contents: read      # Read-only access to code
  pages: write        # Write access only for Pages
  id-token: write     # For secure authentication
```

### 2. **Concurrency Control**
```yaml
concurrency:
  group: "pages"
  cancel-in-progress: false
```
- Prevents multiple simultaneous deployments
- Ensures deployment integrity

### 3. **Environment Protection**
```yaml
environment:
  name: github-pages
```
- Uses protected environment
- Can add manual approval gates if needed

### 4. **Artifact Retention**
```yaml
retention-days: 7
```
- Automatically cleans up old builds
- Reduces storage costs

### 5. **Reproducible Builds**
- Uses `npm ci` instead of `npm install`
- Ensures consistent dependencies

### 6. **Stage Separation**
- Build → Test → Deploy (no shortcuts)
- Each stage validates before proceeding

---

## Continuous Delivery Principles

### ✅ 1. Automated Pipeline
- Zero manual steps required
- Triggers automatically on code push
- Manual trigger available for emergency deploys

### ✅ 2. Quality Gates
- **Gate 1**: Linting must pass
- **Gate 2**: Tests must pass
- **Gate 3**: Build must succeed
- **Gate 4**: Artifacts must be verified
- Only then → Deploy

### ✅ 3. Fast Feedback
- Pipeline completes in ~2-3 minutes
- Clear success/failure messages
- Email notifications on failures

### ✅ 4. Rollback Capability
- Artifacts retained for 7 days
- Can redeploy previous versions
- GitHub Pages maintains version history

### ✅ 5. Visibility
- All stages visible in GitHub Actions
- Real-time progress tracking
- Deployment URL shown on success

---

## Pipeline Flow Diagram

```
┌─────────────────────────────────────────┐
│  TRIGGER: Push to main / Manual         │
└──────────────┬──────────────────────────┘
               │
               ↓
┌──────────────────────────────────────────┐
│         STAGE 1: BUILD                   │
├──────────────────────────────────────────┤
│  1. Checkout code                        │
│  2. Setup Node.js                        │
│  3. Install dependencies (npm ci)        │
│  4. Run linting ✓                        │
│  5. Run tests ✓                          │
│  6. Prepare deployment files             │
│  7. Upload artifacts                     │
└──────────────┬───────────────────────────┘
               │
               ↓
┌──────────────────────────────────────────┐
│    STAGE 2: TEST DEPLOYMENT              │
├──────────────────────────────────────────┤
│  1. Download build artifacts             │
│  2. Verify index.html exists ✓           │
│  3. Validate file structure ✓            │
└──────────────┬───────────────────────────┘
               │
               ↓
┌──────────────────────────────────────────┐
│       STAGE 3: DEPLOY                    │
├──────────────────────────────────────────┤
│  Environment: github-pages               │
│  1. Download artifacts                   │
│  2. Setup GitHub Pages                   │
│  3. Upload to Pages                      │
│  4. Deploy live 🚀                       │
│  5. Output URL                           │
└──────────────┬───────────────────────────┘
               │
               ↓
┌──────────────────────────────────────────┐
│  ✅ DEPLOYMENT COMPLETE                  │
│  🌐 Website Live!                        │
└──────────────────────────────────────────┘
```

---

## How to Enable GitHub Pages

### First Time Setup:

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under **Source**, select:
   - Source: `GitHub Actions`
4. Save changes
5. Push code to trigger deployment

### After Setup:
- Every push to `main` automatically deploys
- No manual steps required

---

## Viewing Deployment Status

### Check Pipeline Status:
1. Go to: `https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/actions`
2. Click on "Deployment Pipeline"
3. View all three stages with status

### View Live Website:
After successful deployment, visit:
`https://MUNEEBAZAM96.github.io/heavens-above_SCD_Assignment_2/`

---

## Local Testing Before Deployment

Test the deployment build locally:

```bash
# Run all checks
npm run lint
npm test

# Test deployment build
mkdir -p dist
cp -r public/* dist/
cd dist && python3 -m http.server 8000

# Visit: http://localhost:8000
```

---

## Deployment Security Features

### 1. **Token Security**
- Uses GitHub's built-in OIDC tokens
- No manual secrets needed
- Tokens expire automatically

### 2. **Read-Only Source**
- Deployment cannot modify source code
- Separate permissions for read/write

### 3. **Environment Isolation**
- Production environment is protected
- Can require manual approvals

### 4. **Audit Trail**
- All deployments logged
- Full history maintained
- Easy to track who deployed what

---

## Continuous Delivery Best Practices

### ✅ Implemented:

1. **Automated Testing Before Deploy**
   - Linting checks code quality
   - Tests validate functionality

2. **Artifact Management**
   - Build once, deploy anywhere
   - Artifacts verified before deployment

3. **Progressive Deployment**
   - Build → Test → Deploy stages
   - Fail fast at each stage

4. **Deployment Verification**
   - Files validated before going live
   - Success confirmation provided

5. **Environment Management**
   - Clear separation of stages
   - Protected production environment

---

## Troubleshooting

### Common Issues:

**1. Deployment fails at "Deploy to GitHub Pages"**
- Solution: Enable GitHub Pages in repository settings
- Go to Settings → Pages → Source: GitHub Actions

**2. "Permission denied" error**
- Solution: Check workflow permissions
- Ensure Pages deployment is allowed

**3. Website shows 404**
- Solution: Check index.html exists in public/
- Verify file paths are correct

---

## Technologies Used

- **CI/CD Platform**: GitHub Actions
- **Hosting**: GitHub Pages
- **Runtime**: Node.js 18
- **Build Tool**: npm
- **Security**: OIDC tokens, environment protection

---

## Assignment Completion ✅

✅ **Deployment pipeline created and working**  
✅ **Three stages: Build → Test → Deploy**  
✅ **Automated deployment to GitHub Pages**  
✅ **Security best practices implemented**  
✅ **Continuous delivery principles followed**  
✅ **Clear feedback and monitoring**

---

## Key Metrics

- **Pipeline Duration**: ~2-3 minutes
- **Deployment Frequency**: Every push to main
- **Failure Rate**: Low (due to quality gates)
- **Recovery Time**: < 5 minutes (just push fix)

---

**Repository**: https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2  
**Live Website**: https://MUNEEBAZAM96.github.io/heavens-above_SCD_Assignment_2/  
**Workflow**: `.github/workflows/deploy.yml`  
**Date**: October 2025

