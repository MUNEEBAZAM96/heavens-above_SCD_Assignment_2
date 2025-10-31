# 🚀 Quick Deploy to GitHub Pages

## 3-Step Deployment

### Step 1: Enable GitHub Pages
1. Go to: https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/settings/pages
2. Under "Source", select **"GitHub Actions"**
3. Done! ✅

### Step 2: Push to Deploy
```bash
git add .
git commit -m "Deploy to GitHub Pages"
git push origin main
```

### Step 3: Wait & Access
- Wait 2-3 minutes
- Visit: https://YOUR_USERNAME.github.io/heavens-above_SCD_Assignment_2-1/

---

## Alternative: Manual Trigger
1. Go to: https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/actions
2. Click "Deploy" → "Run workflow" → "Run workflow"
3. Done! ✅

---

## Test Locally First (Optional)
```bash
./deploy-test.sh
```
Then visit: http://localhost:8000

---

## Monitor Deployment
Check status: https://github.com/YOUR_USERNAME/heavens-above_SCD_Assignment_2-1/actions

Green checkmark = Success! ✅  
Red X = Error (check logs) ❌

---

## Need More Help?
Read the full guide: `GITHUB_PAGES_DEPLOYMENT_GUIDE.md`

