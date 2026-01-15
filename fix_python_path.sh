#!/bin/bash
# Script to fix Python PATH for conda environment

echo "🔧 Fixing Python PATH for tradingagents environment..."

# Step 1: Initialize conda
echo "1. Initializing conda..."
source /opt/anaconda3/etc/profile.d/conda.sh

# Step 2: Activate environment
echo "2. Activating tradingagents environment..."
conda activate tradingagents

# Step 3: Fix PATH
echo "3. Updating PATH to prioritize conda Python..."
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"

# Step 4: Verify
echo ""
echo "✅ Verification:"
echo "   Python location: $(which python)"
echo "   Python version: $(python --version)"

# Step 5: Test typer
echo ""
echo "4. Testing typer import..."
if python -c "import typer; print('✅ typer is working!')" 2>/dev/null; then
    echo "   ✅ SUCCESS: typer is accessible!"
else
    echo "   ❌ ERROR: typer still not found"
    echo "   Trying to install..."
    pip install typer
fi

echo ""
echo "✅ PATH fix complete!"
echo ""
echo "To make this permanent, run:"
echo "  ./make_path_permanent.sh"
echo ""
echo "Or manually add to ~/.zshrc:"
echo "  source /opt/anaconda3/etc/profile.d/conda.sh"
echo "  conda activate tradingagents"
echo "  export PATH=\"/opt/anaconda3/envs/tradingagents/bin:\$PATH\""
