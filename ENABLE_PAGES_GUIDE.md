# How to Enable GitHub Pages - REQUIRED STEP

## ⚠️ IMPORTANT: Do This Before Deployment Works!

Your deployment workflow **will fail** until you enable GitHub Pages in your repository settings.

---

## Step-by-Step Instructions

### 1. Go to Your Repository Settings

Click this link (replace with your repo):
```
https://github.com/MUNEEBAZAM96/heavens-above_SCD_Assignment_2/settings/pages
```

OR manually:
1. Go to your GitHub repository
2. Click **Settings** (top right)
3. Scroll down to **Pages** in the left sidebar
4. Click **Pages**

---

### 2. Configure GitHub Pages

On the Pages settings page:

**Under "Build and deployment":**

1. **Source**: Click the dropdown
2. Select: **"GitHub Actions"**
3. Click **Save**

**Screenshot guide:**
```
┌─────────────────────────────────────┐
│ Build and deployment                │
├─────────────────────────────────────┤
│ Source: [Dropdown ▼]                │
│                                     │
│ Options:                            │
│  ○ Deploy from a branch             │
│  ● GitHub Actions    ← SELECT THIS! │
└─────────────────────────────────────┘
```

---

### 3. Verify Settings

After saving, you should see:
```
✓ Your site is ready to be published
```

---

### 4. Re-run the Workflow

After enabling Pages:

1. Go to: **Actions** tab
2. Find the latest **"Deployment Pipeline"** run
3. Click **Re-run all jobs**

OR just push a new commit:
```bash
git commit --allow-empty -m "Trigger deployment"
git push origin main
```

---

## ✅ Success Indicators

After enabling Pages and re-running workflow:

1. ✅ Workflow completes successfully (green checkmark)
2. ✅ "Deploy to GitHub Pages" step succeeds
3. ✅ You see deployment URL in logs
4. ✅ Website is live!

**Your website URL will be:**
```
https://MUNEEBAZAM96.github.io/heavens-above_SCD_Assignment_2/
```

---

## ❌ Common Issues

### Issue: "Resource not accessible by integration"
**Solution**: You haven't enabled Pages yet. Follow steps above.

### Issue: "Not Found" error
**Solution**: Source must be set to "GitHub Actions", not "Deploy from a branch"

### Issue: Workflow succeeds but website shows 404
**Solution**: 
- Check that `public/index.html` exists
- Verify files are in the `public/` directory
- Wait 1-2 minutes for Pages to build

---

## Need Help?

If you're still having issues:

1. **Check workflow logs** for specific errors
2. **Verify Pages is enabled**: Go to Settings → Pages
3. **Check Source is "GitHub Actions"**
4. **Ensure you have index.html in public/ folder**

---

## Security Note

⚠️ **NEVER share your GitHub tokens!**
- The workflow uses built-in GITHUB_TOKEN
- No manual tokens needed
- If you shared a token, revoke it immediately at:
  https://github.com/settings/tokens

---

**Once Pages is enabled, the deployment will work automatically!** 🚀

