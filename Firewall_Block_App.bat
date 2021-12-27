@ECHO OFF
REM #############################################################
REM Name          : Firewall_Block_App.bat
REM Version       : 1.0
REM Date          : 2021-12-27
REM Author        : LHammonds
REM Purpose       : Add firewall rules to block an application.
REM Compatibility : Verified on to work on: Windows 7,10,2008,2012
REM Requirements  : Right-click Run as Administrator
REM Run Frequency : As needed.
REM Reference     : https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd734783(v=ws.10)
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2021-12-27 1.0 LTH Created script.
REM #############################################################
TITLE Adding Firewall Rules
SET APP="C:\Test\test.exe"
SET APPTITLE="test"
CLS
ECHO.
ECHO Adding 2 rules...
ECHO.
netsh advfirewall firewall add rule name="%APPTITLE%-in" dir=in action=block program="%APP%" enable=yes profile=domain,private,public
netsh advfirewall firewall add rule name="%APPTITLE%-out" dir=out action=block program="%APP%" enable=yes profile=domain,private,public
ECHO.
SET APPTITLE=
SET APP=
PAUSE
