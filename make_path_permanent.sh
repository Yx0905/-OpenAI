#!/bin/bash
# Make the tradingagents environment permanent in ~/.zshrc

echo "🔧 Making tradingagents environment permanent..."

# Check if already configured
if grep -q "tradingagents" ~/.zshrc 2>/dev/null; then
    echo "⚠️  tradingagents is already configured in ~/.zshrc"
    echo "   Skipping to avoid duplicates."
    exit 0
fi

# Add configuration to ~/.zshrc
cat >> ~/.zshrc << 'EOF'

# Qubot Trading Agents - Auto-activate tradingagents environment
# This ensures the correct Python environment is used
conda activate tradingagents 2>/dev/null || true
export PATH="/opt/anaconda3/envs/tradingagents/bin:$PATH"
EOF

echo "✅ Configuration added to ~/.zshrc"
echo ""
echo "📝 Added the following lines:"
echo "   conda activate tradingagents"
echo "   export PATH=\"/opt/anaconda3/envs/tradingagents/bin:\$PATH\""
echo ""
echo "🔄 To apply changes:"
echo "   1. Close and reopen your terminal, OR"
echo "   2. Run: source ~/.zshrc"
echo ""
echo "✅ Done! The tradingagents environment will now activate automatically."
