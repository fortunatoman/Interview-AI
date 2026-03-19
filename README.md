# Interview-Bot

An ASP.NET Core web application for conducting **AI-powered mock technical interviews**. Candidates take text or voice-style interviews on configurable topics and subtopics; the app uses an AI agent (OpenAI) to ask questions, adapt difficulty, and produce scored evaluations with feedback.

## Features

- **Topics & Subtopics** — Create and manage interview topics and subtopics (with objectives) for organizing practice areas.
- **Real-time interviews** — Conduct interviews over **SignalR** (chat-style): the AI asks questions, tracks answers, and can adapt or offer to end early based on responses.
- **Voice interview page** — Dedicated flow for starting an interview from a subtopic (e.g. for voice or unified UX).
- **Public interview flow** — Anonymous/public links to start or continue an interview and view results (no login required for the candidate).
- **Session & results** — List interview sessions, view results with score and evaluation, and **export results to PDF** (DinkToPdf).
- **Authentication** — Cookie-based auth with **BCrypt**; Login, Register, Guest login; **email verification** and verification-code flow.
- **Localization** — English and Spanish (resource files in `Resources/`), with culture selection via query/cookie.
- **Email** — SMTP-based **interview invites** and **verification emails** (configurable in app settings).

## Tech Stack

| Area | Technology |
|------|------------|
| Framework | ASP.NET Core 8, Razor Pages |
| Database | PostgreSQL (Entity Framework Core 9, Npgsql) |
| Real-time | SignalR (chat hub at `/chatHub`) |
| AI | OpenAI API (GPT) via `IAIAgentService` / `OpenAIAgentService`; optional `DeepSeekAgentServices` |
| Auth | Cookie authentication, BCrypt.Net-Next |
| PDF export | DinkToPdf (wkhtmltopdf) |
| Validation | FluentValidation.AspNetCore |
| Client | Bootstrap, jQuery, SignalR client (libman in `wwwroot/lib`) |

## Project Structure

```
Interview-Bot/
├── Data/                 # AppDbContext, EF factory
├── Hubs/                 # ChatHub (SignalR interview logic)
├── Models/               # User, Topic, SubTopic, InterviewSession, InterviewResult, ChatMessage, etc.
├── Pages/                # Razor Pages (Account, Topics, SubTopics, InterviewSessions, VoiceInterview, Chat, Public*, etc.)
├── Resources/            # Localization (en, es) for Pages
├── Services/             # IAIAgentService, OpenAIAgentService, EmailService, PdfService
├── wwwroot/              # Static files, JS, CSS, lib (Bootstrap, jQuery, SignalR)
├── Program.cs            # App configuration, DI, auth, SignalR, localization
└── InterviewBot.csproj
```

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- PostgreSQL server
- OpenAI API key (required for AI interviews)

## Configuration

Use `appsettings.json` (or environment variables / User Secrets) to set:

- **Database** — `ConnectionStrings:DefaultConnection` (PostgreSQL).
- **OpenAI** — `OpenAI:ApiKey`, optional `OpenAI:Model`, `OpenAI:MaxTokens`, etc.
- **Email** — `Email:SmtpServer`, `Email:SmtpPort`, `Email:SmtpUsername`, `Email:SmtpPassword`, `Email:FromEmail`, `Email:FromName` (for invites and verification).

Example (do not commit real secrets):

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Database=InterviewBot;Username=...;Password=..."
  },
  "OpenAI": {
    "ApiKey": "your-openai-api-key",
    "Model": "gpt-4",
    "MaxTokens": 2000
  },
  "Email": {
    "SmtpServer": "smtp.example.com",
    "SmtpPort": 587,
    "SmtpUsername": "...",
    "SmtpPassword": "...",
    "FromEmail": "noreply@example.com",
    "FromName": "InterviewBot"
  }
}
```

## Getting Started

1. **Clone and open** the repository.

2. **Configure** `appsettings.json` (or User Secrets) with PostgreSQL connection string and OpenAI API key (and email if needed).

3. **Apply migrations** (from the project directory):

   ```bash
   dotnet ef database update
   ```

   If you need to add a new migration:

   ```bash
   dotnet ef migrations add YourMigrationName
   ```

4. **Run the application**:

   ```bash
   dotnet run
   ```

   By default the app listens on:

   - HTTP: `http://localhost:5111`
   - HTTPS (if using the `https` profile): `https://localhost:7291`

   Or run with a specific profile (e.g. `https`) or from Visual Studio using the chosen launch profile.

5. **Use the app** — Register or log in, create Topics and SubTopics, then start an interview from a subtopic (or use the public interview/chat/results pages for shareable links).

## Main Pages / Routes

| Route | Description |
|-------|-------------|
| `/` | Index — list of current user’s interview topics |
| `/Account/Login`, `/Account/Register`, `/Account/GuestLogin` | Auth (anonymous) |
| `/Topics/*`, `/SubTopics/*` | CRUD for topics and subtopics |
| `/VoiceInterview` | Voice/interview entry (by `SubTopicId`) |
| `/Chat` | Chat-based interview (anonymous allowed) |
| `/PublicInterview`, `/PublicChat`, `/PublicResults` | Public interview and results |
| `/InterviewSessions/Index`, `/InterviewSessions/Results`, `/InterviewSessions/Export` | Sessions list, result view, PDF export |
| `/EmailVerification`, `/VerificationCode` | Email verification flow |
| `/InterviewFormat` | Interview format selection (anonymous) |

## SignalR Hub

- **URL:** `/chatHub`
- **Main methods:** `StartInterview(subTopicId, language)`, `StartPublicInterview(subTopicId, sessionId)`, `SendAnswer(answer)`, `SendPublicMessage(message, sessionId)`, `CompleteInterviewManually()`, `EndInterviewEarly()`, `ResumeInterview(sessionId)`
- **Client events:** `ReceiveMessage(sender, text)`, `InterviewCompleted(score, evaluation)`, `RedirectToResults(sessionId)`

Interviews are driven by the hub: it uses `IAIAgentService` to generate questions and evaluations, tracks state per connection, and supports both authenticated and public sessions.

## PDF Export

Export uses **DinkToPdf** with a native dependency (`libwkhtmltox.dll` on Windows, under `runtimes/win-x64/native/`). Styling is from `wwwroot/css/pdf-styles.css`.

## License

See repository or solution for license information.

---

Last updated: 2026-03-18
