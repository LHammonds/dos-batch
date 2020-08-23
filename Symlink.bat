@ECHO OFF
REM #############################################################
REM Name          : Symlink.bat
REM Version       : 1.0
REM Date          : 2020-02-22
REM Author        : LHammonds
REM Purpose       : Move files to a different folder and create symbolic link from original location.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : As needed.
REM NOTE          : Be sure to update the correct source and target paths before each run.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2020-02-22 1.0 LTH Created script.
REM #############################################################
TITLE Symbolic Link Folder to Folder
CLS
SET SOURCE=C:\Users\YourUsername\Apple\MobileSync\Backup
SET TARGET=F:\Backup\Apple\Backup
ECHO.
ECHO Source = %SOURCE%
ECHO Target = %TARGET%
ECHO.
ECHO If this is correct, press any key or CTRL+C to cancel.
PAUSE > null
xcopy /E /V /I /F /Y "%SOURCE%" "%TARGET%"
cmd /C rd /S /Q "%SOURCE%"
cmd /C mklink /J "%SOURCE%" "%TARGET%"
ECHO.
ECHO Symbolic link creation commands completed.  Make sure it worked!
PAUSE
