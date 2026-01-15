# How to Generate Reports

## Quick Start

Generate a comprehensive trading analysis report for any stock:

```bash
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"
python generate_report.py <TICKER> <DATE> [format]
```

## Examples

### Example 1: Generate Markdown Report for SPY
```bash
python generate_report.py SPY 2025-01-15
```

### Example 2: Generate Text Report for Apple
```bash
python generate_report.py AAPL 2025-01-15 txt
```

### Example 3: Generate Markdown Report for NVIDIA
```bash
python generate_report.py NVDA 2025-01-15 markdown
```

## Parameters

- **TICKER**: Stock ticker symbol (e.g., SPY, AAPL, NVDA, TSLA)
- **DATE**: Trading date in YYYY-MM-DD format (e.g., 2025-01-15)
- **format**: Optional - either "markdown" (default) or "txt"

## What Gets Generated

The report includes:

1. **Final Trading Decision** - BUY, SELL, or HOLD
2. **Analyst Team Reports**:
   - Market Analysis (technical indicators)
   - Social Sentiment Analysis
   - News Analysis
   - Fundamentals Analysis
   - **Alpha Factors Analysis** (NEW! 50+ quantitative factors)
3. **Research Team Decision**:
   - Bull Researcher Analysis
   - Bear Researcher Analysis
   - Research Manager Decision
4. **Trading Team Plan**
5. **Risk Management Team**:
   - Aggressive Analyst
   - Conservative Analyst
   - Neutral Analyst
   - Portfolio Manager Decision
6. **Final Trade Decision**

## Output Location

Reports are saved to:
```
reports/<TICKER>/<DATE>/
├── <TICKER>_<DATE>_full_report.md  (or .txt)
└── <TICKER>_<DATE>_state.json
```

For example:
```
reports/SPY/2025-01-15/
├── SPY_2025-01-15_full_report.md
└── SPY_2025-01-15_state.json
```

## Full Example

```bash
# Navigate to Qubot directory
cd "/Users/liuyuxiang/Desktop/Qbot selftest/Qubot"

# Generate report for SPY on January 15, 2025
python generate_report.py SPY 2025-01-15

# Wait for analysis to complete...
# The script will show progress and then save the report

# View the generated report
cat reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md
```

## Using Different LLM Providers

The script automatically detects available API keys:
- **DeepSeek** (default) - Uses DEEPSEEK_API_KEY
- **OpenAI/ChatGPT** - Uses OPENAI_API_KEY
- **Google Gemini** - Uses GOOGLE_API_KEY

Make sure your `.env` file has the appropriate API keys set.

## Troubleshooting

### Error: "No API key found"
Make sure your `.env` file exists and contains:
```
DEEPSEEK_API_KEY=your_key_here
# or
OPENAI_API_KEY=your_key_here
```

### Error: "Insufficient data"
Some stocks may not have enough historical data. Try:
- A different date
- A more popular ticker (like SPY, AAPL, MSFT)

### Error: "ModuleNotFoundError"
Make sure you're in the conda environment:
```bash
conda activate tradingagents
source fix_python_path.sh  # If PATH isn't set correctly
```

## Viewing Reports

### View Markdown Report
```bash
cat reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md
```

### View in Terminal (with formatting)
```bash
# Using less
less reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md

# Or open in your default editor
open reports/SPY/2025-01-15/SPY_2025-01-15_full_report.md
```

### View JSON State Data
```bash
cat reports/SPY/2025-01-15/SPY_2025-01-15_state.json | python -m json.tool
```

## Programmatic Usage

You can also use the report generation function in your own Python scripts:

```python
from generate_report import generate_consolidated_report

# Generate report
output_file, json_file = generate_consolidated_report(
    ticker="SPY",
    trade_date="2025-01-15",
    output_format="markdown"
)

print(f"Report saved to: {output_file}")
print(f"State data saved to: {json_file}")
```

## Notes

- The analysis may take several minutes as it runs multiple LLM agents
- The report includes comprehensive alpha factors analysis (50+ factors)
- All decisions are based on quantitative factors and qualitative analysis
- Reports are saved in both human-readable (markdown/txt) and machine-readable (JSON) formats
