@ECHO OFF
REM #############################################################
REM Name          : TimeSetMaster.bat
REM Version       : 1.0
REM Date          : 2016-09-04
REM Author        : LHammonds
REM Purpose       : Set machine to get its time from the Internet.
REM Compatibility : Verified on to work on: Windows 2008,2012
REM Requirements  : Right-click Run as Administrator
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-09-04 1.0 LTH Created script.
REM #############################################################
TITLE Time Synchronization
CLS
ECHO.
ECHO This script is for Windows 2008/2012 servers (or newer)
ECHO.
ECHO Time service will sync to "time.nist.gov" and be master for
ECHO all machines on the local network.
ECHO.
ECHO Press CTRL+C if you need to exit or press any key to continue.
ECHO.
PAUSE > NUL
net stop w32time
w32tm /config /syncfromflags:manual /manualpeerlist:"time.nist.gov"
w32tm /config /reliable:yes
net start w32time
ECHO Resync the time...
w32tm /resync
w32tm /query /status
ECHO.
ECHO ^^ Verify that time.nist.gov is the source above. ^^
ECHO.
PAUSE
