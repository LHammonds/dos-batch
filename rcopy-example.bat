@ECHO OFF
REM #############################################################
REM Name          : rcopy-example.bat
REM Version       : 1.0
REM Date          : 2016-12-12
REM Author        : LHammonds
REM Purpose       : Create a report from a verified file copy.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : Right-click and Run as Administrator
REM Run Frequency : As needed.
REM NOTE          : Be sure to update the correct source and target paths before each run.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-12-12 1.0 LTH Created script.
REM #############################################################
TITLE ROBOCOPY C: to D:

FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
SET "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%"

SET SOURCEDIR=C:\MyData
SET TARGETDIR=D:\MyDataBackup
SET LOGFILE=D:\Apps\%STRDATE%-rcopy.log

ROBOCOPY %SOURCEDIR% %TARGETDIR% *.* /E /COPYALL /LOG+:%LOGFILE% /TEE /R:3 /W:1
