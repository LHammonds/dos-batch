@ECHO OFF
REM #############################################################
REM Name          : TimeGetStatus.bat
REM Version       : 1.0
REM Date          : 2016-09-04
REM Author        : LHammonds
REM Purpose       : Query machine to get its current time setting
REM Compatibility : Verified on to work on: Windows 2008,2012
REM Requirements  : None
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-09-04 1.0 LTH Created script.
REM #############################################################
TITLE Time Synchronization Status
CLS
ECHO.
ECHO This script is for Windows 2008/2012 servers (or newer)
ECHO.
w32tm /query /status
ECHO.
ECHO ^^ Verify that the source above looks correct. ^^
ECHO.
PAUSE
