#!/bin/bash

# Start Backend and Frontend for Heavens Above Satellite Tracking App

echo "🚀 Starting Heavens Above Application"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Check if data exists
echo -e "${BLUE}📊 Step 1: Checking satellite data...${NC}"
if [ -d "public/data/satellite25544" ] && [ "$(ls -A public/data/satellite25544)" ]; then
    echo -e "${GREEN}✅ Satellite data found${NC}"
    echo ""
else
    echo -e "${YELLOW}⚠️  No data found. Running backend to fetch data...${NC}"
    echo ""
    
    # Step 2: Run backend to fetch data
    echo -e "${BLUE}🛰️  Step 2: Fetching satellite data from Heavens Above...${NC}"
    echo "This may take a minute..."
    npm start
    echo -e "${GREEN}✅ Data fetched successfully${NC}"
    echo ""
fi

# Step 3: Start frontend server
echo -e "${BLUE}🌐 Step 3: Starting web server...${NC}"
echo ""
echo -e "${GREEN}✅ Frontend server starting on http://localhost:8000${NC}"
echo ""
echo "========================================"
echo "🎉 Application is ready!"
echo ""
echo "📍 Access your website at:"
echo "   http://localhost:8000"
echo ""
echo "📊 Features:"
echo "   - ISS (International Space Station) tracking"
echo "   - Satellite transit predictions"
echo "   - Iridium flare information"
echo ""
echo "🛑 To stop the server:"
echo "   Press Ctrl+C"
echo ""
echo "========================================"
echo ""

# Start Python server
cd public && python3 -m http.server 8000

