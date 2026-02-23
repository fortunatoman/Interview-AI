# Interview Bot

[![GitHub stars](https://img.shields.io/github/stars/fortunatoman/Interview-Bot?style=social)](https://github.com/fortunatoman/Interview-Bot/stargazers)

An **AI-powered interview practice platform** built with .NET 8. Practice technical interviews with multiple AI providers (OpenAI, Gemini, DeepSeek), get scored feedback, and export results to PDF.

## Features

- **AI-powered interviews** — Practice with GPT, Gemini, or DeepSeek
- **Customizable topics** — Create topics and subtopics for your practice
- **Multi-language support** — English and Spanish
- **PDF export** — Save interview results
- **Guest mode** — Try without signing up
- **Voice & chat** — Multiple interview formats

## Quick Start

1. **Prerequisites:** .NET 8.0, PostgreSQL
2. **Clone & configure:**
   ```bash
   git clone https://github.com/fortunatoman/Interview-Bot.git
   cd Interview-Bot
   ```
3. Set your database connection in `appsettings.json`
4. Add an AI API key (OpenAI, Gemini, or DeepSeek) — see `ai-config.md`
5. Run migrations: `dotnet ef database update`
6. Start: `dotnet run`

See [SETUP_INSTRUCTIONS.md](SETUP_INSTRUCTIONS.md) for full details.

## Tech Stack

- .NET 8, ASP.NET Core Razor Pages
- PostgreSQL, Entity Framework Core
- SignalR, OpenAI / Gemini / DeepSeek APIs
- DinkToPdf for PDF export

## License

See project files for license details.

---

**If this project helps you, consider giving it a ⭐ star!**
