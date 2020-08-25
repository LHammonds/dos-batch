@ECHO OFF
REM #############################################################
REM Name          : Firewall_enable_ping.bat
REM Version       : 1.0
REM Date          : 2016-09-04
REM Author        : LHammonds
REM Purpose       : Enable existing firewall rule to allow ICMP ping.
REM Compatibility : Verified on to work on: Windows 2008,2012
REM Requirements  : Right-click Run as Administrator
REM Run Frequency : As needed.
REM Reference     : https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd734783(v=ws.10)
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-09-04 1.0 LTH Created script.
REM #############################################################
TITLE Modifying Existing Firewall Rule to enable Echo Request (PING)
CLS
ECHO.
ECHO Modifying 1 rule...
ECHO.
REM ** Windows 2008/2012 rule name = "File and Printer Sharing (Echo Request - ICMPv4-In)"
netsh advfirewall firewall set rule name="File and Printer Sharing (Echo Request - ICMPv4-In)" profile=All new enable=yes
ECHO.
PAUSE
