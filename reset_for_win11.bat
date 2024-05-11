@echo off
:: For Navicat 16.3.9 & windows 11 
set dn=Info
set dn2=ShellFolder
set rp=HKEY_CURRENT_USER\Software\Classes\CLSID

reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration16XCS /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f
echo finding.....
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
 echo %%a
for /f "tokens=*" %%l in ('reg query "%%a" /f "%dn%" /s /e ^|findstr /i "%dn%"') do (
  echo deleteing: %%a
  reg delete %%a /f
)
for /f "tokens=*" %%l in ('reg query "%%a" /f "%dn2%" /s /e ^|findstr /i "%dn2%"') do (
  echo deleteing: %%a
  reg delete %%a /f
)
)
echo re trial done!
  

:: start /d "E:Clash.for.Windows-0.20.24-win"  Clash.exe

echo Finish
:: pause
exit