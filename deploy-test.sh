#!/bin/bash

# GitHub Pages Deployment Test Script
# This script tests your website locally before deploying to GitHub Pages

set -e  # Exit on any error

echo "🚀 GitHub Pages Deployment Test"
echo "================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Node.js is installed
echo "📦 Checking Node.js installation..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed!${NC}"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}✅ Node.js $(node --version) found${NC}"
echo ""

# Check if npm is installed
echo "📦 Checking npm installation..."
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed!${NC}"
    exit 1
fi
echo -e "${GREEN}✅ npm $(npm --version) found${NC}"
echo ""

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📥 Installing dependencies..."
    npm install
    echo -e "${GREEN}✅ Dependencies installed${NC}"
    echo ""
else
    echo -e "${GREEN}✅ Dependencies already installed${NC}"
    echo ""
fi

# Run linting
echo "🔍 Running linting checks..."
if npm run lint; then
    echo -e "${GREEN}✅ Linting passed${NC}"
    echo ""
else
    echo -e "${YELLOW}⚠️  Linting has warnings (this is OK)${NC}"
    echo ""
fi

# Run tests
echo "🧪 Running tests..."
if npm test; then
    echo -e "${GREEN}✅ Tests passed${NC}"
    echo ""
else
    echo -e "${RED}❌ Tests failed!${NC}"
    echo "Please fix the test failures before deploying."
    exit 1
fi

# Run build
echo "🏗️  Running build..."
if npm run build; then
    echo -e "${GREEN}✅ Build successful${NC}"
    echo ""
else
    echo -e "${RED}❌ Build failed!${NC}"
    exit 1
fi

# Prepare deployment files (simulate what GitHub Actions does)
echo "📂 Preparing deployment files..."
rm -rf _site
mkdir -p _site
cp -r public/* _site/
echo -e "${GREEN}✅ Files prepared in _site/ directory${NC}"
echo ""

# Check for required files
echo "✅ Verifying deployment structure..."
if [ -f "_site/index.html" ]; then
    echo -e "${GREEN}✅ index.html found${NC}"
else
    echo -e "${RED}❌ index.html not found!${NC}"
    exit 1
fi

if [ -d "_site/css" ]; then
    echo -e "${GREEN}✅ css directory found${NC}"
else
    echo -e "${YELLOW}⚠️  css directory not found${NC}"
fi

if [ -d "_site/data" ]; then
    echo -e "${GREEN}✅ data directory found${NC}"
else
    echo -e "${YELLOW}⚠️  data directory not found${NC}"
fi
echo ""

# Count files
FILE_COUNT=$(find _site -type f | wc -l | tr -d ' ')
echo "📊 Total files to deploy: $FILE_COUNT"
echo ""

# Start local server
echo "🌐 Starting local web server..."
echo -e "${GREEN}✅ Server will start on http://localhost:8000${NC}"
echo ""
echo "Press Ctrl+C to stop the server"
echo "================================"
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    cd _site && python3 -m http.server 8000
elif command -v python &> /dev/null; then
    cd _site && python -m http.server 8000
else
    echo -e "${RED}❌ Python is not installed!${NC}"
    echo "Cannot start local server."
    echo "However, all deployment checks passed!"
    echo ""
    echo "You can now safely deploy to GitHub Pages."
    exit 0
fi

