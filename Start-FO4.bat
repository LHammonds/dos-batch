@ECHO OFF
REM #############################################################
REM Name          : Start-FO4.bat
REM Version       : 1.0
REM Date          : 2020-06-07
REM Author        : LHammonds
REM Purpose       : Switch power modes before starting Fallout4
REM Compatibility : Verified on to work on: Windows 10
REM Requirements  : None
REM Run Frequency : Manual as needed (when starting the game)
REM NOTES         : Fallout4 will freeze PC if the power settings turns off
REM               : the monitor during gameplay.
REM               : List all power scheme GUID's from this command:
REM               :   powercfg -L
REM               : Make sure the 3 variables below match your system.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-06-07 1.0 LTH Created script.
REM #############################################################

SET HIGHPERF=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
SET BALANCED=381b4222-f694-41f0-9685-ff5bb260df2e
SET GAMEPATH="C:\Program Files\Steam\steamapps\common\Fallout 4\"

TITLE Start game with Balanced Power setting
CLS
ECHO.
ECHO This window will close automatically when the game is closed.
ECHO.
ECHO List of power profiles before making changes:
%windir%\system32\powercfg.exe -L
ECHO.
ECHO Setting power profile to "High Performance"
ECHO.
%windir%\system32\powercfg.exe /SETACTIVE %HIGHPERF%
ECHO List of power profiles while game is running:
%windir%\system32\powercfg.exe -L
ECHO.
ECHO Starting game...
CD /D %GAMEPATH%
START /WAIT "Fallout4" Fallout4.exe
%windir%\system32\powercfg.exe /SETACTIVE %BALANCED%
SET GAMEPATH=
SET BALANCED=
SET HIGHPERF=
