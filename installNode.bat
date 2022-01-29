@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

setlocal
CALL :GETPARENT PARENT
IF /I "%PARENT%" == "powershell" GOTO :ISPOWERSHELL
IF /I "%PARENT%" == "pwsh" GOTO :ISPOWERSHELL
endlocal

cls

echo Not running from Powershell 
SET MyEnvVariable=MyValue
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))">NUL && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco
echo installing chocolatey if not already installed
choco upgrade chocolatey -y | find /i "is the latest version available" >NUL
if not errorlevel 1 (
    call :colorEcho a0 "the latest version of chocolatey is already installed!" && timeout 1 /nobreak >NUL && echo.
)
if errorlevel 1 (
    call :colorEcho a0 "installed chocolatey!" && timeout 1 /nobreak >NUL && echo.
)

GOTO :INSTALLNODE


:GETPARENT
SET "PSCMD=$ppid=$pid;while($i++ -lt 3 -and ($ppid=(Get-CimInstance Win32_Process -Filter ('ProcessID='+$ppid)).ParentProcessId)) {}; (Get-Process -EA Ignore -ID $ppid).Name"

for /f "tokens=*" %%i in ('powershell -noprofile -command "%PSCMD%"') do SET %1=%%i

GOTO :EOF

:ISPOWERSHELL

cls

echo. >&2
echo  Running from PowerShell>&2
echo. >&2

powershell -Command "& {Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))}">NUL

choco
echo installing chocolatey if not already installed
choco upgrade chocolatey -y | find /i "is the latest version available" >NUL
if not errorlevel 1 (
    call :colorEcho a0 "the latest version of chocolatey is already installed!" && timeout 1 /nobreak >NUL && echo.
)
if errorlevel 1 (
    call :colorEcho a0 "installed chocolatey!" && timeout 1 /nobreak >NUL && echo.
)


GOTO:INSTALLNODE


:INSTALLNODE


FOR /F "tokens=* USEBACKQ" %%F IN (`node -v`) DO (
SET node=%%F
) 
FOR /F "tokens=* USEBACKQ" %%F IN (`npm -v`) DO (
SET npm=%%F
) 
FOR /F "tokens=* USEBACKQ" %%F IN (`choco list -lo`) DO (
SET chocolist=%%F
) 

cls
call :colorEcho 0d "Reading package lists!" && timeout 1 /nobreak >NUL && echo ... Done
call :colorEcho 0d "Building dependency tree!"
echo.
call :colorEcho 0d "Reading state information!" && timeout 1 /nobreak >NUL && echo ... Done
choco list -lo | find /i "nodejs" >NUL
if not errorlevel 1 (
   call :colorEcho a1 "nodejs !"
   call :colorEcho a0 " %node%!"
   call :colorEcho a5 " is already installed!"
   echo. && timeout 1 /nobreak >NUL
)
if errorlevel 1 (

    call :colorEcho 0b "installing nodejs!" && echo ...
    choco install nodejs -y >NUL

    call :colorEcho a0 "installed nodejs !"
    call :colorEcho a0 " %node%!"
    echo. && timeout 2 /nobreak >NUL

)

call :colorEcho 0d "Reading package lists!" && timeout 1 /nobreak >NUL && echo ... Done
call :colorEcho 0d "Building dependency tree!"
echo.
call :colorEcho 0d "Reading state information!" && timeout 1 /nobreak >NUL && echo ... Done
choco list -lo | find /i "nodejs.install" >NUL
if not errorlevel 1 (
   call :colorEcho a1 "npm !"
   call :colorEcho a0 " %npm%!"
   call :colorEcho a5 " is already installed!"
   echo. && timeout 1 /nobreak >NUL
)
if errorlevel 1 (

    call :colorEcho 0b "installing npm!" && echo ...
    choco install nodejs.install -y >NUL

    call :colorEcho a0 "installed npm !"
    call :colorEcho a0 " %npm%!"
    echo. && timeout 2 /nobreak >NUL

)

echo.
echo installed packages:
choco list -lo | find /i "nodejs" >NUL
if not errorlevel 1 (
call :colorEcho a0 "nodejs!"
call :colorEcho a0 "%node%!"
echo.
)
choco list -lo | find /i "nodejs.install" >NUL
if not errorlevel 1 (
call :colorEcho a0 "npm!"
call :colorEcho a0 "%npm%!"
echo. && timeout 2 /nobreak >NUL
)

curl -o win21install.bat https://raw.githubusercontent.com/Pingu1337/win21installer/main/Install.bat && ./win21install || win21install.bat && rm win21install.bat || del win21install.bat

echo. && timeout 2 /nobreak >NUL
call :colorEcho 0d "win21 installation script executed without errors!"
echo.
call :colorEcho a0 "installation complete!"
echo. && timeout 2 /nobreak >NUL
exit /b 1

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i