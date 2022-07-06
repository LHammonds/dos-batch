@ECHO OFF
REM #############################################################
REM Name          : PingSubnet.bat
REM Version       : 1.0
REM Date          : 2022-07-06
REM Author        : LHammonds
REM Purpose       : Log all active IPs for a subnet to file.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : Schedule as often as desired.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2022-07-06 1.0 LTH Created script.
REM #############################################################

SET PrefixIP=10.75.156
SET MinIP=1
SET MaxIP=254

TITLE Analyzing Subnet %PrefixIP%.x

FOR /f "tokens=2 delims==" %%a IN ('wmic OS Get localdatetime /value') DO SET "dt=%%a"
SET "YY=%dt:~2,2%" & SET "YYYY=%dt:~0,4%" & SET "MM=%dt:~4,2%" & SET "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & SET "Min=%dt:~10,2%" & SET "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
SET LOGFILE="PingSubnet-%STRDATE%.log"

ECHO Active IP Addresses as of %STRDATE% > %LOGFILE%
ECHO ============================================= >> %LOGFILE%
ECHO. >> %LOGFILE%
FOR /L %%a in (%MinIP%,1,%MaxIP%) do (
  ECHO Testing %%a of %MaxIP%
  PING -n 2 %PrefixIP%.%%a|FIND "TTL=">NUL && ECHO %PrefixIP%.%%a >> %LOGFILE%
)
SET LOGFILE=
SET STRDATE=
SET MaxIP=
SET MinIP=
SET PrefixIP=
