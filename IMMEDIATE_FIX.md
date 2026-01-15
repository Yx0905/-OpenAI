# IMMEDIATE FIX - Run This Now!

## In Your Terminal, Run This:

**Copy and paste this entire block into your terminal:**

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
source /opt/anaconda3/etc/profile.d/conda.sh
conda activate tradingagents
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"
which python
python --version
python -c "import typer; print('✅ typer works!')"
```

**Or use the fix script:**

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
source FIX_NOW.sh
```

**Then test:**

```bash
python -m cli.main
```

## If That Doesn't Work, Use Full Path:

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
/opt/anaconda3/envs/tradingagents/bin/python -m cli.main
```

Or for reports:

```bash
/opt/anaconda3/envs/tradingagents/bin/python generate_report.py SPY 2025-01-15
```

## Make It Permanent:

After the fix works, make it permanent by running:

```bash
cat >> ~/.zshrc << 'EOF'

# TradingAgents - Conda Environment Setup
source /opt/anaconda3/etc/profile.d/conda.sh
conda activate tradingagents 2>/dev/null || true
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"
EOF

source ~/.zshrc
```

---

## Quick Reference Commands:

**Run CLI:**
```bash
source FIX_NOW.sh && python -m cli.main
```

**Generate Report:**
```bash
source FIX_NOW.sh && python generate_report.py SPY 2025-01-15
```

**Using Full Path (Always Works):**
```bash
/opt/anaconda3/envs/tradingagents/bin/python -m cli.main
/opt/anaconda3/envs/tradingagents/bin/python generate_report.py SPY 2025-01-15
```
