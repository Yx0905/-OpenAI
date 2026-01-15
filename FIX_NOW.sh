#!/bin/bash
# Quick fix for current terminal session

echo "🔧 Fixing PATH for current terminal..."

# Fix PATH
source /opt/anaconda3/etc/profile.d/conda.sh 2>/dev/null || true
conda activate tradingagents 2>/dev/null || true
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"

# Verify
echo ""
echo "✅ PATH Fixed!"
echo "   Python location: $(which python)"
echo "   Python version: $(python --version)"
echo ""

# Test typer
if python -c "import typer; print('✅ typer is working!')" 2>/dev/null; then
    echo "✅ All good! You can now run:"
    echo "   python -m cli.main"
    echo "   or"
    echo "   python generate_report.py SPY 2025-01-15"
else
    echo "❌ Still having issues. Try using full path:"
    echo "   /opt/anaconda3/envs/tradingagents/bin/python -m cli.main"
fi

echo ""
echo "Note: This fix only works for this terminal session."
echo "To make it permanent, add to ~/.zshrc:"
echo "  source /opt/anaconda3/etc/profile.d/conda.sh"
echo "  conda activate tradingagents"
echo "  export PATH=\"/opt/anaconda3/envs/tradingagents/bin:\$PATH\""
