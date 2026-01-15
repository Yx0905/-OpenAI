#!/bin/bash
# Script to push all files to the new GitHub repository

echo "🚀 Preparing to push to GitHub repository..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Initializing..."
    git init
fi

# Change remote URL to the new repository
echo "📝 Setting remote URL to: https://github.com/Yx0905/-OpenAI.git"
git remote set-url origin https://github.com/Yx0905/-OpenAI.git 2>/dev/null || git remote add origin https://github.com/Yx0905/-OpenAI.git

# Verify remote
echo ""
echo "✅ Remote configured:"
git remote -v
echo ""

# Stage all files
echo "📦 Staging all files..."
git add -A

# Show status
echo ""
echo "📊 Files to be committed:"
git status --short
echo ""

# Commit changes
echo "💾 Committing changes..."
git commit -m "Update: Add bias fixes and documentation

- Fixed bias towards HOLD/SELL in trading decisions
- Enhanced Risk Manager, Trader, and Research Manager prompts
- Fixed bug: Risk Manager now uses fundamentals_report correctly
- Added comprehensive documentation (BIAS_ANALYSIS_AND_FIXES.md, DETAILED_BIAS_EXPLANATION.md)
- Added setup and installation scripts
- Improved BUY decision framework with explicit tiebreakers"

echo ""
echo "📤 Pushing to GitHub..."
echo ""

# Push to repository
# Try main branch first, then master if main doesn't exist
if git branch --list | grep -q "main"; then
    git push -u origin main
elif git branch --list | grep -q "master"; then
    git push -u origin master
else
    echo "⚠️  No main or master branch found. Creating main branch..."
    git branch -M main
    git push -u origin main
fi

echo ""
echo "✅ Done! Check your repository at: https://github.com/Yx0905/-OpenAI.git"
