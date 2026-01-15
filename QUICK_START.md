# Quick Start Guide

## Problem: Python PATH Issue

Even though you're in the `(tradingagents)` conda environment, `python` might still be using the system Python. Use the scripts below.

## Solution: Use These Scripts

I've created helper scripts that fix the PATH automatically.

### Run CLI Interface

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
./run_cli.sh
```

This will:
1. Activate the conda environment
2. Fix the PATH
3. Run the CLI interface

### Generate Report

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
./run_report.sh SPY 2025-01-15
```

**Examples:**
```bash
# Generate report for SPY
./run_report.sh SPY 2025-01-15

# Generate report for Apple
./run_report.sh AAPL 2025-01-15

# Generate text format report
./run_report.sh NVDA 2025-01-15 txt
```

## Alternative: Fix PATH Manually (Current Terminal)

Run these commands in your current terminal:

```bash
# Fix PATH for this terminal session
source /opt/anaconda3/etc/profile.d/conda.sh
conda activate tradingagents
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"

# Verify it's working
which python
# Should show: /opt/anaconda3/envs/tradingagents/bin/python

python --version
# Should show: Python 3.11.14

# Now run CLI
python -m cli.main

# Or generate report
python generate_report.py SPY 2025-01-15
```

## Alternative: Use Full Path to Python

If PATH still doesn't work, use the full path:

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"

# Run CLI with full path
/opt/anaconda3/envs/tradingagents/bin/python -m cli.main

# Generate report with full path
/opt/anaconda3/envs/tradingagents/bin/python generate_report.py SPY 2025-01-15
```

## Make PATH Fix Permanent

To fix this permanently, add to your `~/.zshrc`:

```bash
# Add this to ~/.zshrc
cat >> ~/.zshrc << 'EOF'

# TradingAgents - Fix Python PATH
source /opt/anaconda3/etc/profile.d/conda.sh
conda activate tradingagents 2>/dev/null || true
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"
EOF

# Reload shell config
source ~/.zshrc
```

## Recommended: Use the Scripts

The easiest way is to use the helper scripts:
- `./run_cli.sh` - For interactive CLI
- `./run_report.sh TICKER DATE` - For generating reports

These scripts handle everything automatically!
