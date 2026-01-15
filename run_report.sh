#!/bin/bash
# Script to generate report with correct Python

cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"

# Initialize conda
source /opt/anaconda3/etc/profile.d/conda.sh

# Activate environment
conda activate tradingagents

# Fix PATH
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"

# Get parameters
TICKER=${1:-SPY}
DATE=${2:-2025-01-15}
FORMAT=${3:-markdown}

# Verify
echo "Using Python: $(which python)"
echo "Python version: $(python --version)"
echo "Generating report for $TICKER on $DATE..."
echo ""

# Generate report
python generate_report.py "$TICKER" "$DATE" "$FORMAT"
