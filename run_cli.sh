#!/bin/bash
# Script to run CLI with correct Python

cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"

# Initialize conda
source /opt/anaconda3/etc/profile.d/conda.sh

# Activate environment
conda activate tradingagents

# Fix PATH
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"

# Verify
echo "Using Python: $(which python)"
echo "Python version: $(python --version)"
echo ""

# Run CLI
python -m cli.main
