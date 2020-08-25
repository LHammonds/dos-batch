@ECHO OFF
REM #############################################################
REM Name          : Firewall_add_Nagios.bat
REM Version       : 1.0
REM Date          : 2016-09-04
REM Author        : LHammonds
REM Purpose       : Add firewall rules to allow communication from Nagios server.
REM Compatibility : Verified on to work on: Windows 7,10,2008,2012
REM Requirements  : Right-click Run as Administrator
REM Run Frequency : As needed.
REM Reference     : https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd734783(v=ws.10)
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-09-04 1.0 LTH Created script.
REM #############################################################
TITLE Adding Nagios to Firewall Rules
SET NAGIOSIP=192.168.107.21
CLS
ECHO.
ECHO Adding 3 inbound rules...
ECHO.
netsh advfirewall firewall add rule name="Nagios 12489 TCP" dir=in action=allow localport=12489 remoteport=any protocol=tcp remoteip=%NAGIOSIP% profile=domain
netsh advfirewall firewall add rule name="Nagios 12489 UDP" dir=in action=allow localport=12489 remoteport=any protocol=udp remoteip=%NAGIOSIP% profile=domain
netsh advfirewall firewall add rule name="Nagios 5666 TCP" dir=in action=allow localport=5666 remoteport=any protocol=tcp remoteip=%NAGIOSIP% profile=domain
ECHO.
SET NAGIOSIP=
PAUSE
