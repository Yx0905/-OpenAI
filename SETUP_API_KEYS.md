# Setting Up API Keys

## Quick Setup

1. **Open the `.env` file** in the `Qubot` directory:
   ```bash
   cd Qubot
   nano .env
   # or use your preferred editor: vim, code, etc.
   ```

2. **Replace the placeholder values** with your actual API keys:
   ```bash
   DEEPSEEK_API_KEY=sk-your-actual-deepseek-key-here
   OPENAI_API_KEY=sk-your-actual-openai-key-here
   ```

## Getting Your API Keys

### DeepSeek API Key
1. Go to https://platform.deepseek.com/
2. Sign up or log in
3. Navigate to API Keys section
4. Create a new API key
5. Copy the key (starts with `sk-`)

### OpenAI API Key (ChatGPT)
1. Go to https://platform.openai.com/api-keys
2. Sign up or log in
3. Click "Create new secret key"
4. Copy the key (starts with `sk-`)

## Using Both Keys

The system will use:
- **DeepSeek** when `llm_provider` is set to `"deepseek"` (default)
- **OpenAI** when `llm_provider` is set to `"openai"`

You can configure which one to use in your code:

```python
from tradingagents.default_config import DEFAULT_CONFIG

config = DEFAULT_CONFIG.copy()

# Option 1: Use DeepSeek (default)
config["llm_provider"] = "deepseek"
config["deep_think_llm"] = "deepseek-reasoner"
config["quick_think_llm"] = "deepseek-chat"

# Option 2: Use OpenAI/ChatGPT
config["llm_provider"] = "openai"
config["deep_think_llm"] = "gpt-4o"
config["quick_think_llm"] = "gpt-4o-mini"
```

## Security Note

⚠️ **Never commit your `.env` file to git!** It's already in `.gitignore` to prevent accidental commits.

## Testing Your Keys

After setting up your keys, test them:

```bash
cd Qubot
python -c "from dotenv import load_dotenv; import os; load_dotenv(); print('DeepSeek:', 'Set' if os.getenv('DEEPSEEK_API_KEY') else 'Missing'); print('OpenAI:', 'Set' if os.getenv('OPENAI_API_KEY') else 'Missing')"
```

This will show if your keys are loaded correctly.
