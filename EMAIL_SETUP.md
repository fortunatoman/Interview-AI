# Email Setup Guide

## Current Issue
The email sending is failing due to SMTP connection issues. The publish functionality works, but emails are not being sent.

## Your Current Configuration
```json
"Email": {
  "SmtpServer": "smtp.gmail.com",
  "SmtpPort": 587,
  "SmtpUsername": "satoyuki000309@gmail.com",
  "SmtpPassword": "eztylvgtnhhtydjl",
  "FromEmail": "satoyuki000309@gmail.com",
  "FromName": "InterviewBot"
}
```

## Troubleshooting Steps

### Step 1: Verify Gmail App Password
1. Go to your Google Account settings
2. Enable 2-Factor Authentication if not already enabled
3. Go to Security → App passwords
4. Generate a new app password for "InterviewBot"
5. Replace the current password with the new app password

### Step 2: Check Gmail Security Settings
1. Go to Gmail settings
2. Check if "Less secure app access" is enabled (though App Password is preferred)
3. Make sure your account isn't locked due to suspicious activity

### Step 3: Network/Firewall Issues
The error `SocketException (10060)` suggests network connectivity issues:

1. **Check if you're behind a corporate firewall** that blocks SMTP ports
2. **Try different ports** (the updated service now tries multiple ports automatically)
3. **Check antivirus software** that might be blocking SMTP connections

### Step 4: Test Email Configuration
The updated EmailService now:
- ✅ Tries multiple SMTP configurations automatically
- ✅ Has better error logging
- ✅ Won't block the publish operation if email fails

## Quick Fix Options

### Option 1: Disable Email (Recommended for Testing)
If you don't need email functionality right now, you can disable it by commenting out the email sending code in `Pages/SubTopics/Index.cshtml.cs`:

```csharp
// Comment out this block to disable email sending
/*
try
{
    await _emailService.SendInterviewInviteAsync(subTopic);
}
catch (Exception ex)
{
    _logger.LogWarning(ex, "Failed to send email for subtopic {SubTopicId}, but publish operation completed successfully", subTopic.Id);
}
*/
```

### Option 2: Use Alternative Email Service
Consider using a different email service like:
- SendGrid
- Mailgun
- Amazon SES

### Option 3: Test with Different Gmail Settings
Try updating your `appsettings.json` with these alternative settings:

```json
"Email": {
  "SmtpServer": "smtp.gmail.com",
  "SmtpPort": 465,
  "SmtpUsername": "satoyuki000309@gmail.com",
  "SmtpPassword": "your-new-app-password",
  "FromEmail": "satoyuki000309@gmail.com",
  "FromName": "InterviewBot"
}
```

## Current Status
✅ **Publish functionality works** - subtopics are being published successfully
❌ **Email sending fails** - due to SMTP connection issues
✅ **No blocking errors** - publish operation completes even if email fails
✅ **Enhanced error logging** - better debugging information

## Recommendation
1. **First, try generating a new Gmail App Password**
2. **If that doesn't work, temporarily disable email** using Option 1
3. **The publish feature works perfectly** regardless of email status
4. **Consider using a professional email service** for production use 