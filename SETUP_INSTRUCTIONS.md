# InterviewBot Setup Instructions

## Prerequisites Installation

### 1. .NET SDK 8.0
- Download and install .NET SDK 8.0 from: https://dotnet.microsoft.com/download/dotnet/8.0
- Verify installation: `dotnet --version`

### 2. PostgreSQL Database
- Download and install PostgreSQL from: https://www.postgresql.org/download/
- Create a new database for the application
- Note down your database credentials

### 3. PDF Export Dependency (Windows)
- The required PDF library (`libwkhtmltox.dll`) is already included in the project under `InterviewBot/runtimes/win-x64/native/` and `InterviewBot/wwwroot/libwkhtmltox/`.
- **No need to install Ext2Fsd or any additional PDF drivers on Windows.**

## Application Setup

### 1. Database Connection
Edit `InterviewBot/appsettings.json` and update the connection string:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Database=interviewbot;Username=your_username;Password=your_password"
  }
}
```

### 2. AI API Key Configuration
- To use AI-powered interviews, you must provide an API key for OpenAI or your chosen provider.
- Edit `InterviewBot/ai-config.md` or `InterviewBot/appsettings.json` and add your API key and model configuration as instructed in the file.
- Example for OpenAI:
```json
{
  "OpenAI": {
    "ApiKey": "your_openai_api_key",
    "Model": "gpt-4"
  }
}
```

### 3. Run Database Migrations
Open terminal/command prompt in the `InterviewBot` folder and run:
```bash
dotnet ef database update
```

### 4. Run the Application
```bash
dotnet run
```

The application will be available at: `https://localhost:5001` or `http://localhost:5000`

## First Time Setup
1. Register a new account or use guest login ("Continue as Guest")
2. Create topics and subtopics for your interview sessions
3. Start your first AI-powered interview!

## Troubleshooting
- Ensure all prerequisites are properly installed
- Check database connection string format
- Verify .NET SDK version: `dotnet --version`
- For PDF export issues, ensure `libwkhtmltox.dll` is present in the `runtimes/win-x64/native/` folder
- For AI interview issues, ensure your API key is correctly set in `ai-config.md` or `appsettings.json`
- For guest login, note that guest sessions may not be saved long-term

## Support
If you encounter any issues, check the application logs or contact support. 