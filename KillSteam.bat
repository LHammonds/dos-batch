@ECHO OFF
REM #############################################################
REM Name          : KillSteam.bat
REM Version       : 1.0
REM Date          : 2017-12-14
REM Author        : LHammonds
REM Purpose       : Kill specific processes on demand for whatever reason.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : As needed.
REM NOTE          : Be sure to update the correct source and target paths before each run.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2017-12-14 1.0 LTH Created script.
REM #############################################################
TITLE Verifying Steam Processes Are Not Running
CLS

:FINDEXE
ECHO Checking if tasks are running...
TASKLIST /FI "IMAGENAME eq steam.exe" | FIND /I /N "steam.exe" > NUL
IF "%ERRORLEVEL%"=="0" GOTO KILL1
TASKLIST /FI "IMAGENAME eq SteamService.exe" | FIND /I /N "SteamService.exe" > NUL
IF "%ERRORLEVEL%"=="0" GOTO KILL2
TASKLIST /FI "IMAGENAME eq steamwebhelper.exe" | FIND /I /N "steamwebhelper.exe" > NUL
IF "%ERRORLEVEL%"=="0" GOTO KILL3
GOTO DONE

:KILL1
ECHO.
ECHO Killing Steam.exe
ECHO.
TASKKILL /F /IM steam.exe
PING 127.0.0.1 -n 3 > NUL
GOTO FINDEXE

:KILL2
ECHO.
ECHO Killing SteamService.exe
ECHO.
TASKKILL /F /IM SteamService.exe
PING 127.0.0.1 -n 3 > NUL
GOTO FINDEXE

:KILL3
ECHO.
ECHO Killing SteamWebHelper.exe
ECHO.
TASKKILL /F /IM steamwebhelper.exe
PING 127.0.0.1 -n 3 > NUL
GOTO FINDEXE

:DONE
ECHO.
ECHO No Steam process is running.
