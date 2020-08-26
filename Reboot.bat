@ECHO OFF
REM #############################################################
REM Name          : Reboot.bat
REM Version       : 1.0
REM Date          : 2015-10-25
REM Author        : LHammonds
REM Purpose       : Cleanly reboot computer.
REM Compatibility : Verified on to work on: Windows 7,10,2000,2003,2008,2012
REM Requirements  : If scheduled to run when nobody is logged in, be
REM                 sure to grant full folder/file permissions to the
REM                 user attached to the schedule.
REM Example       : cmd.exe /c D:\Apps\Reboot.bat
REM Run Frequency : Schedule to run when you expect PC should be off.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2018-03-19 1.0 LTH Created script.
REM #############################################################
TITLE Reboot
SET DATESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TIMESTAMP=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DATEANDTIME=%DATESTAMP% %TIMESTAMP%
SET LOG=D:\Apps\Reboot.log
SET STATUS=C:\Rebooting.txt
CLS

REM ** Log reboot **
ECHO %DATEANDTIME% - Rebooting %COMPUTERNAME% >> %LOG%
ECHO %DATEANDTIME% - Rebooting %COMPUTERNAME% >> %STATUS%

REM ** Stop services **
ECHO -- Stopping Service: W3SVC >> %LOG%
NET STOP W3SVC

REM ** Reboot **
SHUTDOWN /r /t 60 /f /c "Daily Reboot" /d p:4:1

SET DATESTAMP=
SET TIMESTAMP=
SET DATEANDTIME=
SET LOG=
SET STATUS=
