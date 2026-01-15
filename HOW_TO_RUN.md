# How to Run TradingAgents with Alpha Factors

## Prerequisites

1. **Install dependencies:**
   ```bash
   cd Qubot
   pip install -r requirements.txt
   ```

2. **Set up API keys:**
   Create a `.env` file in the `Qubot` directory with your API keys:
   ```bash
   cp .env.example .env
   # Edit .env with your actual API keys
   ```
   
   Required API keys:
   - `OPENAI_API_KEY` or `DEEPSEEK_API_KEY` (for LLM agents)
   - `ALPHA_VANTAGE_API_KEY` (optional, for fundamental/news data)
   - `GOOGLE_API_KEY` (optional, for Google Gemini models)

## Running Methods

### Method 1: Interactive CLI (Recommended)

Run the interactive CLI interface:
```bash
cd Qubot
python -m cli.main
```

This will show an interactive menu where you can:
- Select ticker symbols
- Choose analysis date
- Select which analysts to include (make sure to include "alpha_factors")
- Configure LLM models
- Set debate rounds

**Note:** When selecting analysts, include `alpha_factors` to use the new alpha factors analysis.

### Method 2: Generate Report Script

Generate a comprehensive report for a specific ticker and date:
```bash
cd Qubot
python generate_report.py <TICKER> <DATE> [format]
```

**Examples:**
```bash
# Generate markdown report for SPY on 2025-01-15
python generate_report.py SPY 2025-01-15

# Generate text report
python generate_report.py AAPL 2025-01-15 txt
```

The report will be saved in `reports/<TICKER>/<DATE>/` directory and includes:
- Market Analysis
- Social Sentiment Analysis
- News Analysis
- Fundamentals Analysis
- **Alpha Factors Analysis** (NEW!)
- Research Team Decision
- Trading Team Plan
- Risk Management Team
- Final Trade Decision

### Method 3: Python Script (Programmatic)

Create your own Python script:

```python
from tradingagents.graph.trading_graph import TradingAgentsGraph
from tradingagents.default_config import DEFAULT_CONFIG
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Create a custom config
config = DEFAULT_CONFIG.copy()
config["deep_think_llm"] = "gpt-4o-mini"  # or "deepseek-chat"
config["quick_think_llm"] = "gpt-4o-mini"  # or "deepseek-chat"
config["max_debate_rounds"] = 1
config["max_risk_discuss_rounds"] = 1

# Configure data vendors
config["data_vendors"] = {
    "core_stock_apis": "yfinance",
    "technical_indicators": "yfinance",
    "fundamental_data": "alpha_vantage",  # or "yfinance"
    "news_data": "yfinance",  # or "alpha_vantage", "google"
}

# Initialize TradingAgents with alpha factors analyst
ta = TradingAgentsGraph(
    selected_analysts=["market", "social", "news", "fundamentals", "alpha_factors"],  # Include alpha_factors!
    debug=False,
    config=config
)

# Run analysis
ticker = "SPY"
trade_date = "2025-01-15"
final_state, decision = ta.propagate(ticker, trade_date)

print(f"Final Decision: {decision}")
print(f"\nAlpha Factors Report:\n{final_state.get('alpha_factors_report', 'N/A')}")
```

Save this as `run_analysis.py` and run:
```bash
python run_analysis.py
```

## Using Alpha Factors

The alpha factors analyst is now integrated by default when you include `"alpha_factors"` in the `selected_analysts` list. It will:

1. **Calculate 50+ alpha factors** across 7 categories:
   - Price and Volume Factors
   - Fundamental Factors
   - Analyst Expectation Factors
   - Market Microstructure and Risk Factors
   - Corporate Actions and Fund Flow Factors
   - Industry and Style Factor Exposures
   - Technical Patterns and Complex Indicators

2. **Provide quantitative insights** that support BUY, SELL, or HOLD decisions

3. **Be considered by all agents**:
   - Bull and Bear Researchers use it in their debates
   - Research Manager considers it in the investment plan
   - Trader uses it for final decision
   - Risk Manager evaluates it for risk assessment

## Example Output

When you run the analysis, you'll see output like:

```
Running analysis for SPY on 2025-01-15...
✅ Consolidated report saved to: reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md
📄 Report length: 45231 characters
📊 State data saved to: reports/SPY/2025-01-15/SPY_2025-01-15_state.json
```

The report will include a comprehensive Alpha Factors Analysis section with all calculated factors and their interpretations.

## Troubleshooting

1. **API Key Issues:**
   - Make sure your `.env` file is in the `Qubot` directory
   - Check that API keys are correctly set

2. **Import Errors:**
   - Make sure you're in the `Qubot` directory when running
   - Ensure all dependencies are installed: `pip install -r requirements.txt`

3. **Data Issues:**
   - Some factors require sufficient historical data (at least 20-252 days)
   - If you get "Insufficient data" errors, try a different date or ticker

4. **Alpha Factors Not Showing:**
   - Make sure `"alpha_factors"` is included in `selected_analysts`
   - Check that the alpha factors analyst ran successfully in the logs

## Quick Start Example

```bash
# 1. Navigate to Qubot directory
cd Qubot

# 2. Make sure .env file exists with API keys
# (Create it if it doesn't exist)

# 3. Run a quick analysis
python generate_report.py SPY 2025-01-15

# 4. Check the generated report
cat reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md
```
