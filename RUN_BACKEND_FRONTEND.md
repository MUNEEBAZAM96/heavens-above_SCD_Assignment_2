# Running Backend and Frontend Guide

## 🎯 Current Status: ✅ RUNNING

### Frontend (Website)
- **Status:** ✅ Running
- **URL:** http://localhost:8000
- **Port:** 8000
- **Server:** Python HTTP Server (Process ID: 17700)

### Backend (Data Fetching)
- **Status:** ✅ Data exists (303 files)
- **Last Updated:** October 31, 2024
- **Data Location:** `public/data/satellite25544/`
- **Note:** Backend runs on-demand to update satellite data

---

## 🌐 Access Your Application

**Open in browser:**
```
http://localhost:8000
```

### What You'll See:
- 🛰️ International Space Station (ISS) transit predictions
- ✨ Iridium flare information
- 📊 Detailed satellite tracking tables
- 🗺️ Star charts and orbital maps
- 📥 Report generation and download features

---

## 🏗️ Application Architecture

### Frontend (Static Website)
**Location:** `public/` directory
**Files:**
- `index.html` - Main page with satellite tracking
- `download.html` - Star chart viewer
- `css/ha.css` - Styling
- `data/satellite25544/` - Satellite data (303 files)

**Technology:**
- HTML5 + CSS3 + JavaScript
- jQuery + Bootstrap 3
- html2canvas, QRCode.js
- Served via Python HTTP server

### Backend (Data Scraper)
**Location:** `run.js` and `src/` directory
**Files:**
- `run.js` - Main scraper script
- `src/satellite.js` - Satellite data fetcher
- `src/iridium.js` - Iridium flare fetcher
- `src/utils.js` - Utility functions

**Technology:**
- Node.js
- Cheerio (HTML parsing)
- Request (HTTP client)

**What it does:**
- Scrapes Heavens Above website
- Fetches ISS transit predictions
- Downloads star charts and orbital maps
- Saves data to `public/data/`

---

## 🚀 How to Run Both Backend and Frontend

### Option 1: Easy One-Command Start (Recommended)
```bash
./start-app.sh
```

This script:
1. Checks if data exists
2. Fetches fresh data if needed (runs backend)
3. Starts the frontend server
4. Opens at http://localhost:8000

### Option 2: Manual Control

**Start Frontend Only (if data exists):**
```bash
cd public
python3 -m http.server 8000
```

**Run Backend to Update Data:**
```bash
# Fetch fresh satellite data
npm start
# or
node run.js
```

**Then Start Frontend:**
```bash
cd public
python3 -m http.server 8000
```

### Option 3: Run Backend and Frontend Separately

**Terminal 1 - Backend (update data):**
```bash
npm start
# Wait for it to complete (~1-2 minutes)
```

**Terminal 2 - Frontend (web server):**
```bash
cd public
python3 -m http.server 8000
```

---

## 🔄 Updating Satellite Data

Satellite data becomes outdated over time. To fetch fresh data:

```bash
# Stop the frontend server (if running)
# Press Ctrl+C

# Run the backend scraper
npm start

# Or run directly
node run.js

# Wait for completion (shows progress)
# Data will be saved to public/data/satellite25544/

# Restart frontend
cd public
python3 -m http.server 8000
```

**When to update:**
- Data is more than a week old
- ISS orbit has changed significantly
- Need latest transit predictions
- Want fresh Iridium flare data

---

## 🛑 Stopping the Application

### Stop Frontend Server:
```bash
# Press Ctrl+C in the terminal
# Or:
lsof -ti:8000 | xargs kill -9
```

### Stop Backend (if running):
```bash
# Press Ctrl+C in the terminal
```

---

## ⚙️ NPM Error Solution

### The Problem:
```
npm install - g serve
❌ Error: EEXIST, permission denied
```

### The Solutions:

**Solution 1: Use Python Server (What We're Using)**
```bash
python3 -m http.server 8000
```
✅ No installation needed
✅ No permissions required
✅ Works perfectly

**Solution 2: Fix npm Cache (if you want npm serve)**
```bash
# Fix npm permissions
sudo chown -R $(whoami) ~/.npm

# Clean cache
npm cache clean --force

# Install serve correctly (no space in -g)
npm install -g serve

# Run serve
serve public -p 8000
```

**Solution 3: Use npx (No Installation)**
```bash
npx serve public -p 8000
```

---

## 📦 Available npm Scripts

From `package.json`:

```bash
npm start          # Run backend (fetch satellite data)
npm run lint       # Check code quality
npm run test       # Run tests
npm run build      # Validate build
npm run build:full # Run backend (same as npm start)
```

---

## 🧪 Full Development Workflow

### 1. Install Dependencies
```bash
npm install
```

### 2. Fetch Satellite Data
```bash
npm start
```

### 3. Start Web Server
```bash
cd public
python3 -m http.server 8000
```

### 4. Open Browser
```
http://localhost:8000
```

### 5. Test Features
- View ISS transits
- Check Iridium flares
- Generate reports
- Download data

### 6. Run Quality Checks
```bash
npm run lint    # Code quality
npm test        # Tests
```

### 7. Deploy to GitHub Pages
```bash
git add .
git commit -m "Updated satellite data"
git push origin main
```

---

## 📊 Data Structure

```
public/data/satellite25544/
├── index.json              # Main data file with all transits
├── [hash].html            # Individual transit details (tables)
├── [hash].png             # Star charts for each transit
└── ... (303 files total)
```

**Data includes:**
- Transit dates and times
- Rise, culmination, and set times
- Altitude and azimuth angles
- Satellite brightness (magnitude)
- Distance from observer
- Sun altitude (for visibility)
- Star charts with satellite path

---

## 🔍 Troubleshooting

### Frontend Won't Load
**Check:**
```bash
# Is server running?
lsof -i :8000

# Is port available?
curl http://localhost:8000

# Check for errors
# Open browser console (F12)
```

### Backend Fails
**Check:**
```bash
# Dependencies installed?
ls node_modules

# Node version correct?
node --version  # Should be >= 12.10.0

# Network connection?
ping heavens-above.com
```

### Data Not Showing
**Check:**
```bash
# Does data exist?
ls public/data/satellite25544/ | wc -l

# Is index.json valid?
cat public/data/satellite25544/index.json | head

# Run backend to fetch data
npm start
```

---

## 🚀 Quick Commands Reference

```bash
# Start everything (easy)
./start-app.sh

# Frontend only
cd public && python3 -m http.server 8000

# Backend only
npm start

# Stop server
lsof -ti:8000 | xargs kill -9

# Update data
npm start

# Deploy
git push origin main
```

---

## 📱 Features to Test

When running locally, test:
- [ ] ISS transit table loads
- [ ] Iridium flare table loads
- [ ] Star chart links work (click "查看")
- [ ] Checkbox selection works
- [ ] Generate report button works
- [ ] Download generated report works
- [ ] QR code appears (desktop view)
- [ ] Mobile responsive design
- [ ] All CSS and JS loads without errors
- [ ] Navigation menu works

---

## 🌍 Accessing from Other Devices

To access from phone/tablet on same network:

```bash
# Find your computer's IP
ifconfig | grep "inet " | grep -v 127.0.0.1

# Share this URL with devices on same network
http://YOUR_IP:8000
```

---

## 🎓 Understanding the Application

### How It Works:

1. **Backend Scrapes Data**
   - Connects to Heavens Above website
   - Fetches ISS transit predictions for location
   - Downloads star charts as images
   - Saves everything to `public/data/`

2. **Frontend Displays Data**
   - Loads `index.json` with all transits
   - Displays in interactive tables
   - Shows dates, times, coordinates
   - Links to individual star charts
   - Allows generating custom reports

3. **User Interacts**
   - Views upcoming ISS passes
   - Checks Iridium flare predictions
   - Selects interesting events
   - Generates astronomy reports
   - Downloads as Word documents

---

## ✅ Everything is Working!

**Current Status:**
- ✅ Frontend running on http://localhost:8000
- ✅ Satellite data loaded (303 files)
- ✅ No npm errors (using Python server)
- ✅ Ready to use!

**Access now:** http://localhost:8000

---

**Created:** October 31, 2025  
**Project:** Heavens Above - Satellite Tracking Application

