# AI Provider Configuration

This application supports multiple AI providers. You can easily switch between them by changing the configuration.

## Current Configuration

The AI provider is controlled by the `AIProvider` setting in `appsettings.json`:

```json
{
  "AIProvider": "OpenAI"  // or "Gemini" or "DeepSeek"
}
```

## Available Providers

### 1. OpenAI (GPT-3.5-turbo)
- **Configuration**: `"AIProvider": "OpenAI"`
- **API Key**: Configured in `appsettings.json` under `OpenAI:ApiKey`
- **Model**: gpt-3.5-turbo
- **Features**: 
  - Expert technical interviewing
  - Question generation
  - Interview evaluation with scoring
  - Multi-language support

### 2. Gemini (Google)
- **Configuration**: `"AIProvider": "Gemini"`
- **API Key**: Configured in `appsettings.json` under `Gemini:ApiKey`
- **Model**: gemini-pro
- **Features**: 
  - Expert technical interviewing
  - Question generation
  - Interview evaluation with scoring
  - Multi-language support

### 3. DeepSeek
- **Configuration**: `"AIProvider": "DeepSeek"`
- **API Key**: Configured in `appsettings.json` under `DeepSeek:ApiKey`
- **Model**: deepseek-chat
- **Features**: 
  - Expert technical interviewing
  - Question generation
  - Interview evaluation with scoring
  - Multi-language support

## How to Switch

1. **To use OpenAI**: Set `"AIProvider": "OpenAI"` in `appsettings.json`
2. **To use Gemini**: Set `"AIProvider": "Gemini"` in `appsettings.json`
3. **To use DeepSeek**: Set `"AIProvider": "DeepSeek"` in `appsettings.json`
4. **Restart the application** after changing the configuration

## Fallback Behavior

- If no `AIProvider` is specified, the application defaults to Gemini
- If the specified provider fails, the application will continue with error handling
- All providers implement the same interface, so switching is seamless

## API Keys

Make sure you have valid API keys configured for the provider you want to use:

- **OpenAI**: Get your API key from https://platform.openai.com/
- **Gemini**: Get your API key from https://aistudio.google.com/app/apikey
- **DeepSeek**: Get your API key from https://platform.deepseek.com/

## Testing

You can test the AI service by visiting: `http://localhost:5111/testgemini`

This endpoint will use whichever AI provider is currently configured.
