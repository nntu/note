

@echo on

REM Check Windows Version
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2000
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_XP
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2003
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Vista
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Win7
goto warn_and_exit




:ver_Win7
:Run Windows 7 specific commands here
REM echo OS Version: Windows 7 (debug line)

FOR /F "tokens=*" %%a in ('dir "C:\Users" /ad/b/o') do (
del /s /q "C:\Users\%%a\AppData\Local\Temp\*.*"
for /f "Tokens=*" %%G in ('dir /A /B C:\Users\%%a\AppData\Local\Temp') do rd /s /q "C:\Users\%%a\AppData\Local\Temp\%%G"

del /s /q "C:\Users\%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
for /f "Tokens=*" %%G in ('dir /A /B "C:\Users\%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files"') do rd /s /q "C:\Users\%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\%%G"

)


goto end

:ver_Vista
:Run Windows Vista specific commands here
REM echo OS Version: Windows Vista (debug line)
goto end

:ver_2003
:Run Windows Server 2003 specific commands here
REM echo OS Version: Windows Server 2003 (debug line)

FOR /F "tokens=*" %%a in ('dir "C:\DOCUMENTS AND SETTINGS" /ad/b/o') DO ( 
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5\*.*"
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\*.*"
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp\*.*"
for /f "Tokens=*" %%G in ('dir /A /B "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp"') do rd /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp\%%G"
for /f "Tokens=*" %%G in ('dir /A /B "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5"') do rd /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5\%%G"
)
cd /D C:\Documents and Settings
REM ?-Clean Temp Folder?
for /D %%a in (*.*) do DEL /F /S /Q "%%a\Local Settings\Temp\*.*"
for /D %%a in (*.*) do FOR /D %%b IN ("%%a\Local Settings\Temp\*.*") DO RMDIR /S /Q "%%b"
REM ?-Clean IE Cache?
for /D %%a in (*.*) do DEL /F /S /Q "%%a\Local Settings\Temporary Internet Files\*.*"
for /D %%a in (*.*) do FOR /D %%b IN ("%%a\Local Settings\Temporary Internet Files\*.*") DO RMDIR /S /Q "%%b"
goto end

:ver_XP
:Run Windows XP specific commands here
REM echo OS Version: Windows XP (debug line)

FOR /F "tokens=*" %%a in ('dir "C:\DOCUMENTS AND SETTINGS" /ad/b/o') DO ( 
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5\*.*"
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\*.*"
del /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp\*.*"
for /f "Tokens=*" %%G in ('dir /A /B "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp"') do rd /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\Temp\%%G"
for /f "Tokens=*" %%G in ('dir /A /B "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5"') do rd /s /q "C:\DOCUMENTS AND SETTINGS\%%a\LOCAL SETTINGS\TEMPORARY INTERNET FILES\Content.IE5\%%G"
)
goto end

:ver_2000
:Run Windows 2000 specific commands here
REM echo OS Version: Windows 2000 (debug line)
goto end

:warn_and_exit
echo Machine OS cannot be determined.

:end  


del /s /q "C:\WINDOWS\Temp\*.*"
for /f "Tokens=*" %%G in ('dir /B C:\WINDOWS\Temp') do rd /s /q "C:\WINDOWS\Temp\%%G"

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8



del /s /q  "C:\WINDOWS\system32\config\systemprofile\Local Settings\Temp\*.*"
