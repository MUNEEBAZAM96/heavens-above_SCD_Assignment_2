# GitHub Pages Deployment Guide
## Step-by-Step Instructions to Deploy Your Website

### 🎯 Overview
This guide will help you deploy your Heavens Above satellite tracking website to GitHub Pages.

---

## ✅ Pre-Deployment Checklist

Before deploying, ensure:
- [x] Deployment workflow exists at `.github/workflows/deploy.yml`
- [x] Website files are in the `public/` directory
- [x] `package.json` has necessary scripts (lint, test, build)
- [x] Repository is on GitHub

---

## 📋 Step 1: Enable GitHub Pages

### Option A: Direct Link (Fastest)
Visit this URL (replace with your actual repo URL):
```
https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/settings/pages
```

### Option B: Manual Navigation
1. Go to your GitHub repository
2. Click **Settings** (top menu bar)
3. In the left sidebar, scroll down and click **Pages**

### Configure the Source
On the Pages settings page:
1. Under **"Build and deployment"** section
2. Find **"Source"** dropdown
3. Select **"GitHub Actions"** (NOT "Deploy from a branch")
4. The page will auto-save

You should see a message:
```
✓ Your site is ready to be published
```

---

## 📋 Step 2: Verify Workflow Configuration

Your deployment workflow is already configured. Here's what it does:

**File:** `.github/workflows/deploy.yml`

```yaml
Triggers:
  ✓ Automatic: On every push to 'main' branch
  ✓ Manual: Via "Actions" tab → "Run workflow"

Quality Checks:
  ✓ Runs ESLint (code quality)
  ✓ Runs tests
  ✓ Validates build

Deployment:
  ✓ Copies files from public/ directory
  ✓ Uploads to GitHub Pages
  ✓ Deploys live site
```

---

## 📋 Step 3: Deploy Your Website

### Method 1: Push to Main Branch (Automatic)
Simply push any commit to the `main` branch:

```bash
# Make a small change (or use --allow-empty to skip changes)
git commit --allow-empty -m "Deploy to GitHub Pages"
git push origin main
```

### Method 2: Manual Trigger
1. Go to your repository on GitHub
2. Click the **Actions** tab
3. Click **Deploy** workflow (left sidebar)
4. Click **Run workflow** button (right side)
5. Select branch: `main`
6. Click **Run workflow**

---

## 📋 Step 4: Monitor Deployment

### Watch the Progress:
1. Go to **Actions** tab in your repository
2. Click on the latest **"Deploy"** workflow run
3. Watch the deployment steps:
   - ✅ Checkout code
   - ✅ Setup Node.js
   - ✅ Install dependencies
   - ✅ Run linting
   - ✅ Run tests
   - ✅ Build
   - ✅ Prepare files
   - ✅ Upload to Pages
   - ✅ Deploy to GitHub Pages

**Expected Duration:** 2-3 minutes

### Success Indicators:
- All steps show green checkmarks ✅
- Last step shows: "Deployed to https://YOUR_USERNAME.github.io/heavens-above_SCD_Assignment_2-1/"
- Email notification (if enabled)

---

## 📋 Step 5: Access Your Live Website

After successful deployment, your website will be available at:

```
https://YOUR_USERNAME.github.io/heavens-above_SCD_Assignment_2-1/
```

**Note:** Replace `YOUR_USERNAME` with your actual GitHub username.

You can find the exact URL:
1. Go to repository **Settings** → **Pages**
2. Look for: "Your site is live at ..."
3. OR check the workflow logs in **Actions** tab

---

## 🎨 What Gets Deployed

Your deployed website includes:
```
/
├── index.html          # Main page (satellite tracking)
├── download.html       # Download page
├── css/
│   ├── ha.css         # Styles
│   └── ha.origin.css  # Original styles
├── data/
│   └── satellite25544/ # ISS tracking data
└── (all other files from public/)
```

---

## 🔧 Troubleshooting

### Issue 1: Workflow Fails at "Deploy to GitHub Pages"
**Error:** "Resource not accessible by integration"

**Solution:**
- ✅ Ensure GitHub Pages is enabled (Step 1)
- ✅ Source must be set to "GitHub Actions"
- ✅ Check workflow permissions in Settings → Actions → General

### Issue 2: Website Shows 404 Error
**Causes & Solutions:**
1. **Pages not fully deployed yet**
   - Wait 1-2 minutes after workflow completes
   - Check Settings → Pages for deployment status

2. **Wrong URL**
   - Verify URL format: `https://USERNAME.github.io/REPO-NAME/`
   - Check exact repository name (case-sensitive)

3. **index.html missing**
   - Verify `public/index.html` exists in your repository
   - Check workflow logs to ensure files were copied

### Issue 3: Linting or Tests Fail
**Solution:**
```bash
# Run locally to see errors
npm run lint
npm test

# Fix lint errors automatically
npm run lint:fix

# Then commit and push again
git add .
git commit -m "Fix linting errors"
git push origin main
```

### Issue 4: "Permission denied" Error
**Solution:**
1. Go to Settings → Actions → General
2. Scroll to "Workflow permissions"
3. Select "Read and write permissions"
4. Save changes
5. Re-run the workflow

### Issue 5: Workflow Doesn't Trigger
**Causes:**
- ✅ Make sure you pushed to `main` branch (not `master` or other)
- ✅ Check `.github/workflows/deploy.yml` exists
- ✅ Check repository Settings → Actions → "Allow all actions"

---

## 🚀 Advanced Configuration

### Custom Domain (Optional)
If you have a custom domain:

1. Go to Settings → Pages
2. Under "Custom domain", enter your domain
3. Click Save
4. Add CNAME record at your DNS provider:
   ```
   CNAME record: YOUR_DOMAIN → YOUR_USERNAME.github.io
   ```
5. Wait for DNS propagation (up to 24 hours)

### Add Deployment Status Badge
Add this to your README.md:
```markdown
![Deploy Status](https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/actions/workflows/deploy.yml/badge.svg)
```

### Automatic Updates
To keep satellite data fresh, your project already has a scheduled workflow that can be enhanced:

```yaml
# In .github/workflows/scheduled-data-update.yml
on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday at midnight
  workflow_dispatch:
```

---

## 📊 Deployment Best Practices

### ✅ Before Pushing to Main:
```bash
# Always test locally first
npm run lint          # Check code quality
npm test             # Run tests
npm run build        # Validate build

# If all pass, then deploy
git push origin main
```

### ✅ Monitor Your Deployments:
- Check the Actions tab regularly
- Set up email notifications for failures
- Review deployment logs if issues occur

### ✅ Rollback Strategy:
If a deployment breaks your site:
```bash
# Revert the last commit
git revert HEAD
git push origin main

# Or revert to a specific commit
git revert <commit-hash>
git push origin main
```

---

## 📱 Verify Deployment Checklist

After deployment, check:
- [ ] Website loads at GitHub Pages URL
- [ ] All CSS styles are applied correctly
- [ ] JavaScript functionality works (satellite tracking)
- [ ] Images and data files load properly
- [ ] Mobile responsiveness works
- [ ] No console errors (open browser DevTools)
- [ ] All links work correctly

---

## 🔗 Quick Reference Links

### Your Repository URLs (Update with your username):
- **Repository:** `https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1`
- **Settings:** `https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/settings`
- **Pages Settings:** `https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/settings/pages`
- **Actions:** `https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/actions`
- **Live Site:** `https://YOUR_USERNAME.github.io/heavens-above_SCD_Assignment_2-1/`

### GitHub Documentation:
- [GitHub Pages Official Guide](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## 🎉 Success!

Once deployed, your Heavens Above satellite tracking website will be:
- ✅ Publicly accessible via GitHub Pages URL
- ✅ Automatically updated on every push to main
- ✅ Free hosting forever
- ✅ HTTPS enabled by default
- ✅ Fast content delivery via GitHub's CDN

---

## 📞 Need Help?

If you encounter issues:
1. Check the **Troubleshooting** section above
2. Review workflow logs in the **Actions** tab
3. Verify all steps were completed correctly
4. Check GitHub Pages status: https://www.githubstatus.com/

---

**Last Updated:** October 31, 2025  
**Project:** Heavens Above - Satellite Tracking Web Application  
**Deployment Target:** GitHub Pages via GitHub Actions

