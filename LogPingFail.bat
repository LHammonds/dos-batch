@ECHO OFF
REM #############################################################
REM Name          : LogPingFail.bat
REM Version       : 1.0
REM Date          : 2020-10-09
REM Author        : LHammonds
REM Purpose       : Log ping failures to file.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : Pass the desired IP to ping as a parameter.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-10-09 1.0 LTH Created script.
REM #############################################################
TITLE LogPingFail
SET LOGFILE=LogPingFail.log
FOR /f "tokens=*" %%A IN ('ping -n 1 %1 ^|FIND "Pinging %1"') DO ECHO %%A >> %LOGFILE%
:TOP
SET DATESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TIMESTAMP=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DATEANDTIME=%DATESTAMP% %TIMESTAMP%
FOR /f "tokens=3 delims=," %%A IN ('PING -n 1 %1 ^|FIND "Lost = 1"') DO ECHO %DATEANDTIME% - [%%A] >> %LOGFILE%
CHOICE /c x /t 1 /d x >nul
GOTO TOP
