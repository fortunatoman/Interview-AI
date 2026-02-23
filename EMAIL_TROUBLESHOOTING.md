# Email Troubleshooting Guide

## Current Error: SocketException (10060)
The error indicates a network connectivity issue with Gmail's SMTP server.

## ✅ Enhanced Email Service
I've updated the EmailService to:
- Try multiple SMTP ports (587, 465, 25)
- Use different SSL configurations
- Implement 15-second timeouts
- Provide detailed logging for each attempt

## 🔧 Quick Fixes to Try

### 1. **Generate New Gmail App Password** (Most Common Fix)
1. Go to [Google Account Settings](https://myaccount.google.com/)
2. Navigate to **Security** → **2-Step Verification**
3. Scroll down to **App passwords**
4. Generate a new app password for "InterviewBot"
5. Update your `appsettings.json`:

```json
"Email": {
  "SmtpServer": "smtp.gmail.com",
  "SmtpPort": 587,
  "SmtpUsername": "satoyuki000309@gmail.com",
  "SmtpPassword": "your-new-app-password-here",
  "FromEmail": "satoyuki000309@gmail.com",
  "FromName": "InterviewBot"
}
```

### 2. **Check Gmail Security Settings**
- Ensure 2-Factor Authentication is enabled
- Check if your account is locked due to suspicious activity
- Verify "Less secure app access" is disabled (use App Password instead)

### 3. **Network/Firewall Issues**
The error suggests network connectivity problems:

**Corporate/Office Networks:**
- Contact your IT department
- Ask them to allow SMTP ports: 587, 465, 25
- Check if they block Gmail SMTP servers

**Home Networks:**
- Try disabling antivirus temporarily
- Check Windows Firewall settings
- Try using a mobile hotspot to test

### 4. **Alternative Email Configuration**
Try these different settings in `appsettings.json`:

**Option A: Port 465 (SSL)**
```json
"SmtpPort": 465
```

**Option B: Port 25 (No SSL)**
```json
"SmtpPort": 25
```

**Option C: Different Gmail Account**
```json
"SmtpUsername": "your-other-gmail@gmail.com",
"SmtpPassword": "app-password-for-other-account",
"FromEmail": "your-other-gmail@gmail.com"
```

## 🧪 Testing Email Configuration

### Test with Simple Email
Add this temporary method to test email sending:

```csharp
// Add this to EmailService.cs for testing
public async Task TestEmailAsync()
{
    try
    {
        var subject = "Test Email";
        var body = "<h1>Test Email</h1><p>If you receive this, email is working!</p>";
        
        using var client = new SmtpClient("smtp.gmail.com", 587)
        {
            EnableSsl = true,
            Credentials = new NetworkCredential(_config.SmtpUsername, _config.SmtpPassword),
            Timeout = 15000
        };

        var message = new MailMessage
        {
            From = new MailAddress(_config.FromEmail, _config.FromName),
            Subject = subject,
            Body = body,
            IsBodyHtml = true
        };

        message.To.Add(_config.SmtpUsername); // Send to yourself

        await client.SendMailAsync(message);
        Console.WriteLine("Test email sent successfully!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Test email failed: {ex.Message}");
    }
}
```

## 🚀 Alternative Solutions

### Option 1: Use Different Email Service
Consider switching to:
- **SendGrid** (Free tier: 100 emails/day)
- **Mailgun** (Free tier: 5,000 emails/month)
- **Amazon SES** (Very cheap)

### Option 2: Disable Email Temporarily
If you don't need email right now, comment out the email sending code in `Pages/SubTopics/Index.cshtml.cs`:

```csharp
// Comment out this block
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

### Option 3: Use Gmail API (Advanced)
For production, consider using Gmail API instead of SMTP for better reliability.

## 📊 Current Status
- ✅ **Publish functionality works** - Interview publishing succeeds
- ✅ **Enhanced error handling** - Better logging and retry logic
- ✅ **Multiple SMTP configurations** - Automatic fallback
- ❌ **Email sending fails** - Network/authentication issue

## 🎯 Recommended Action Plan
1. **First**: Generate a new Gmail App Password
2. **Second**: Test with the new password
3. **Third**: If still failing, try different ports
4. **Fourth**: Consider alternative email service
5. **Fifth**: Temporarily disable email if needed

## 📞 Need Help?
If you're still having issues:
1. Check the application logs for detailed error messages
2. Try the test email method above
3. Consider using a different Gmail account for testing
4. Contact your network administrator if on corporate network

The enhanced EmailService will now try multiple configurations automatically, so you should see more detailed logs about which attempts succeed or fail. 