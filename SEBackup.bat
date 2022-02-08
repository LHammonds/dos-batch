@ECHO OFF
REM #############################################################
REM Name          : SEBackup.bat
REM Version       : 1.0
REM Date          : 2022-02-07
REM Author        : LHammonds
REM Purpose       : Create timestamped backup archives of singleplayer savegames for Space Engineers
REM Compatibility : Verified on to work on: Windows 7,10,11,2012
REM Requirements  : 7-Zip archive - https://www.7-zip.org/
REM Run Frequency : Schedule as often as desired.
REM NOTE #1       : Be sure to update the correct path for BAKDIR where the archives will go.
REM NOTE #2       : Make sure to update the path to the 7-Zip executable to match your installation.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2022-02-07 1.0 LTH Created script.
REM #############################################################
CLS
TITLE Backing up Savegames
REM ** Correctly set this path to match your installation.
SET SAVEDIR=%AppData%\SpaceEngineers\Saves
REM ** The target backup path can be anywhere you want or just set it to the same place as above.
SET BAKDIR=E:\GameBackup
SET ZIP=D:\Apps\7-Zip\7z.exe
FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
SET "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-SpaceEngineers.7z %SAVEDIR%\*
