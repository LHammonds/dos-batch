@ECHO OFF
REM #############################################################
REM Name          : ShutdownPC.bat
REM Version       : 1.0
REM Date          : 2018-03-19
REM Author        : LHammonds
REM Purpose       : Shutdown computer.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : If run in Task Schedule, run as admin.
REM Run Frequency : Schedule to run when you expect PC should be off.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2018-03-19 1.0 LTH Created script.
REM #############################################################
TITLE Shutting down PC
CLS
ECHO Stopping print spooler...
C:\Windows\system32\net.exe stop spooler
ECHO Shutting down PC...
C:\Windows\system32\shutdown.exe /s /f /t 0 /d p:0:0 /c "Shutdown PC via batch file"
