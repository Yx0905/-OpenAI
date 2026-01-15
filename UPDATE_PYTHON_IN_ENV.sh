#!/bin/bash
# Script to update Python in conda environment

echo "🔧 Updating Python in tradingagents environment..."

# Step 1: Make sure conda is initialized
source /opt/anaconda3/etc/profile.d/conda.sh 2>/dev/null || true

# Step 2: Activate environment
conda activate tradingagents

# Step 3: Check current Python
echo "Current Python version:"
python --version
which python

# Step 4: Update Python to 3.11
echo ""
echo "📦 Installing Python 3.11..."
conda install python=3.11 -y

# Step 5: Verify update
echo ""
echo "✅ Updated Python version:"
python --version
which python

# Step 6: Install packages
echo ""
echo "📦 Installing required packages..."
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
pip install -r requirements.txt

echo ""
echo "✅ Done! Test with: python -m cli.main"
