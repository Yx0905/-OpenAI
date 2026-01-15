#!/bin/bash
# Install dependencies for Qubot

echo "🔍 Checking Python installation..."
echo "Current Python: $(which python)"
echo "Python version: $(python --version)"

echo ""
echo "📦 Installing dependencies..."
echo ""

# Try to install with the current Python
python -m pip install --user typer rich questionary langchain-openai langchain-experimental langgraph pandas yfinance langchain_anthropic langchain_deepseek langchain_google_genai openai sentence-transformers chromadb chainlit stockstats eodhd praw feedparser tushare finnhub-python parsel requests tqdm pytz redis typing-extensions akshare backtrader setuptools

echo ""
echo "✅ Installation complete!"
echo ""
echo "🧪 Testing import..."
python -c "import typer; print('✅ typer imported successfully')" 2>&1 || echo "❌ Import failed - you may need to install manually"
