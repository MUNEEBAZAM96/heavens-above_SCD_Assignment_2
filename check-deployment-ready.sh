#!/bin/bash

# Quick deployment readiness check
# Run this before deploying to catch any issues

echo "🔍 GitHub Pages Deployment Readiness Check"
echo "=========================================="
echo ""

ERRORS=0
WARNINGS=0

# Check 1: index.html exists
if [ -f "public/index.html" ]; then
    echo "✅ public/index.html exists"
else
    echo "❌ public/index.html NOT FOUND - CRITICAL!"
    ERRORS=$((ERRORS + 1))
fi

# Check 2: CSS files exist
if [ -d "public/css" ]; then
    echo "✅ public/css directory exists"
else
    echo "⚠️  public/css directory not found"
    WARNINGS=$((WARNINGS + 1))
fi

# Check 3: Workflow file exists
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ .github/workflows/deploy.yml exists"
else
    echo "❌ .github/workflows/deploy.yml NOT FOUND - CRITICAL!"
    ERRORS=$((ERRORS + 1))
fi

# Check 4: package.json exists and has required scripts
if [ -f "package.json" ]; then
    echo "✅ package.json exists"
    
    if grep -q '"lint"' package.json; then
        echo "✅ npm run lint script found"
    else
        echo "⚠️  npm run lint script not found"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    if grep -q '"test"' package.json; then
        echo "✅ npm test script found"
    else
        echo "⚠️  npm test script not found"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    if grep -q '"build"' package.json; then
        echo "✅ npm run build script found"
    else
        echo "⚠️  npm run build script not found"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "❌ package.json NOT FOUND - CRITICAL!"
    ERRORS=$((ERRORS + 1))
fi

# Check 5: Git repository
if [ -d ".git" ]; then
    echo "✅ Git repository initialized"
    
    # Check current branch
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ "$BRANCH" = "main" ]; then
        echo "✅ On 'main' branch"
    else
        echo "⚠️  Currently on '$BRANCH' branch (deployment triggers on 'main')"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Check if there are uncommitted changes
    if [ -z "$(git status --porcelain)" ]; then
        echo "✅ No uncommitted changes"
    else
        echo "⚠️  You have uncommitted changes"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Check if remote is set
    if git remote get-url origin &>/dev/null; then
        REMOTE_URL=$(git remote get-url origin)
        echo "✅ Remote origin set: $REMOTE_URL"
    else
        echo "❌ No remote origin set - CRITICAL!"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo "❌ Not a git repository - CRITICAL!"
    ERRORS=$((ERRORS + 1))
fi

# Check 6: Node modules
if [ -d "node_modules" ]; then
    echo "✅ node_modules installed"
else
    echo "⚠️  node_modules not found (run: npm install)"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""
echo "=========================================="
echo "Summary:"
echo "  Errors: $ERRORS"
echo "  Warnings: $WARNINGS"
echo ""

if [ $ERRORS -eq 0 ]; then
    if [ $WARNINGS -eq 0 ]; then
        echo "🎉 All checks passed! Ready to deploy!"
        echo ""
        echo "Next steps:"
        echo "1. Enable GitHub Pages at: https://github.com/YOUR_USERNAME/REPO_NAME/settings/pages"
        echo "2. Set Source to: GitHub Actions"
        echo "3. Run: git push origin main"
        exit 0
    else
        echo "⚠️  Ready to deploy with warnings."
        echo "Consider fixing warnings for best results."
        exit 0
    fi
else
    echo "❌ Cannot deploy! Please fix the errors above."
    exit 1
fi

