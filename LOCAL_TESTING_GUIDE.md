# Local Testing Guide

## 🌐 Running the Website Locally

### Quick Start
```bash
# Option 1: Direct server (simplest)
cd public
python3 -m http.server 8000

# Option 2: Use the test script (runs checks first)
./deploy-test.sh
```

Then visit: **http://localhost:8000**

---

## 🧪 What to Test Before Deploying

### 1. Visual Checks
- [ ] Page loads without errors
- [ ] CSS styles are applied correctly
- [ ] Navigation bar displays properly
- [ ] Tables are formatted correctly
- [ ] Bootstrap components work (dropdowns, buttons)

### 2. Functional Tests
- [ ] Satellite data tables load
- [ ] ISS transit information displays
- [ ] Iridium flare data shows
- [ ] Checkboxes work for selecting events
- [ ] "Generate" button creates reports
- [ ] "Download" button works after generation
- [ ] QR code appears in mobile menu
- [ ] Links to external sites work (GitHub, Heavens Above)

### 3. Data Verification
- [ ] Satellite data loads from `data/satellite25544/`
- [ ] Images load correctly
- [ ] Charts/star maps display
- [ ] No 404 errors in browser console

### 4. Mobile Responsiveness
- [ ] Open browser DevTools (F12)
- [ ] Toggle device toolbar (Ctrl+Shift+M / Cmd+Shift+M)
- [ ] Test on different screen sizes
- [ ] Mobile menu works correctly
- [ ] QR code features work

### 5. Browser Console Check
- [ ] Open DevTools (F12)
- [ ] Check Console tab for errors
- [ ] All JavaScript should load without errors
- [ ] Check Network tab for failed requests

---

## 🐛 Common Local Testing Issues

### Issue: CSS Not Loading
**Check:**
- Files exist in `public/css/`
- Paths are relative (not absolute)
- Browser cache (try Ctrl+F5 hard refresh)

### Issue: JavaScript Errors
**Check:**
- Browser console for specific errors
- External CDN libraries loaded (jQuery, Bootstrap)
- Data files exist in `public/data/`

### Issue: Data Not Loading
**Check:**
- `public/data/satellite25544/index.json` exists
- JSON files are valid (no syntax errors)
- Server is running in `public/` directory

---

## 🔍 Testing Different Scenarios

### Test 1: Satellite Data Display
1. Navigate to homepage
2. Scroll to "国际空间站（ISS）过境" section
3. Verify table shows satellite transit data
4. Check that dates, times, and coordinates display

### Test 2: Generate Report Feature
1. Check some boxes in the satellite table
2. Scroll to "生成天象预告" section
3. Click "生成" (Generate) button
4. Wait for processing
5. Click "下载" (Download) button
6. Verify Word document downloads

### Test 3: Star Chart Links
1. Find "星图" (Star Chart) column in tables
2. Click "查看" (View) link
3. Should open `download.html` with chart image
4. Verify image loads correctly

---

## 🎨 Browser Testing Checklist

Test in multiple browsers if possible:
- [ ] Chrome/Chromium
- [ ] Firefox
- [ ] Safari (macOS)
- [ ] Edge

---

## ⚡ Quick Commands

### Start Server
```bash
# From project root
cd public && python3 -m http.server 8000

# Or from anywhere
python3 -m http.server 8000 --directory public
```

### Stop Server
Press `Ctrl + C` in the terminal

### Change Port (if 8000 is busy)
```bash
python3 -m http.server 8080  # Use port 8080 instead
```

---

## 📊 Pre-Deployment Checklist

Before deploying to GitHub Pages:
- [ ] All local tests pass
- [ ] No console errors
- [ ] All features work as expected
- [ ] Mobile responsive
- [ ] Links work correctly
- [ ] Data loads properly
- [ ] Images display
- [ ] JavaScript functionality works

---

## 🚀 Deploy After Testing

Once local testing is successful:
```bash
# Commit any fixes
git add .
git commit -m "Your commit message"

# Deploy
git push origin main
```

The GitHub Actions workflow will deploy to:
`https://MUNEEBAZAM96.github.io/heavens-above_SCD_Assignment_2/`

---

## 🔧 Advanced Testing

### Test with Full Build Process
```bash
# Run the complete test (simulates GitHub Actions)
./deploy-test.sh
```

This script:
1. Checks Node.js/npm installation
2. Installs dependencies
3. Runs linting
4. Runs tests
5. Runs build
6. Prepares deployment files
7. Starts local server

### Test Specific Components
```bash
# Linting only
npm run lint

# Tests only
npm test

# Build only
npm run build
```

---

## 📱 Mobile Testing Tips

### Using Browser DevTools:
1. Press F12 to open DevTools
2. Click device toolbar icon (or Ctrl+Shift+M)
3. Select device: iPhone, iPad, Android, etc.
4. Test portrait and landscape orientations

### Test on Real Device:
1. Find your computer's IP address:
   ```bash
   # macOS/Linux
   ipconfig getifaddr en0
   # Or
   ifconfig | grep "inet "
   ```
2. Make sure device is on same network
3. Access: `http://YOUR_IP:8000`
4. QR code feature should hide on mobile

---

## 🆘 Troubleshooting Local Server

### Port Already in Use
```bash
# Kill process using port 8000
lsof -ti:8000 | xargs kill -9

# Or use different port
python3 -m http.server 8080
```

### Permission Denied
```bash
# Use port > 1024 (doesn't require sudo)
python3 -m http.server 8000
```

### Python Not Found
```bash
# Try python instead of python3
python -m http.server 8000

# Or install Python from python.org
```

---

## ✅ Success Criteria

Your website is ready to deploy when:
- ✅ All pages load correctly
- ✅ No console errors
- ✅ All features work
- ✅ Data displays properly
- ✅ Mobile responsive
- ✅ Cross-browser compatible

---

**Happy Testing! 🎉**

Once everything works locally, deploy with confidence!


