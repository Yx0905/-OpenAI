# Installing Dependencies

## Issue: ModuleNotFoundError

If you're getting `ModuleNotFoundError: No module named 'typer'` or similar errors, you need to install the dependencies.

## Solution

### Step 1: Activate Your Conda Environment

Since you're using conda (I see `(tradingagents)` in your prompt), make sure you're in the right environment:

```bash
# Activate your conda environment
conda activate tradingagents

# Verify you're in the right environment
which python
# Should show something like: /opt/anaconda3/envs/tradingagents/bin/python
```

### Step 2: Install Dependencies

**Option A: Using pip (Recommended)**
```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
pip install -r requirements.txt
```

**Option B: If you get permission errors, try:**
```bash
pip install --user -r requirements.txt
```

**Option C: Using conda (if pip fails)**
```bash
# Install most packages via conda
conda install -c conda-forge pandas numpy yfinance requests pytz tqdm

# Then install the rest via pip
pip install typer rich questionary langchain-openai langchain-experimental langgraph chromadb langchain_anthropic langchain_deepseek langchain_google_genai openai sentence-transformers
```

### Step 3: Verify Installation

Test if typer is installed:
```bash
python -c "import typer; print('✅ typer installed successfully')"
```

### Step 4: Try Running Again

```bash
python -m cli.main
```

## Common Issues

### Issue 1: Permission Denied
If you get permission errors, try:
```bash
pip install --user -r requirements.txt
```

### Issue 2: Wrong Python Version
Make sure you're using Python 3.9+:
```bash
python --version  # Should be 3.9 or higher
```

### Issue 3: Conda Environment Not Activated
```bash
# List all environments
conda env list

# Activate the correct one
conda activate tradingagents

# Verify
which python
```

### Issue 4: Missing Specific Package
Install individually:
```bash
pip install typer rich questionary
```

## Quick Fix Command

Run this complete setup:
```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
conda activate tradingagents
pip install --user typer rich questionary langchain-openai langchain-experimental langgraph pandas yfinance langchain_anthropic langchain_deepseek langchain_google_genai openai
```

Then try:
```bash
python -m cli.main
```
