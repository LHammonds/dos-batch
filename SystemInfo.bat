@ECHO OFF
REM #############################################################
REM Name          : SystemInfo.bat
REM Version       : 1.0
REM Date          : 2021-07-27
REM Author        : LHammonds
REM Purpose       : Output system information to log file that can be imported to spreadsheet.
REM Compatibility : Verified on to work on: Windows 10,2012
REM Requirements  : None
REM Run Frequency : Schedule as often as desired.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2021-07-27 1.0 LTH Created script.
REM #############################################################
TITLE Collecting Statistics

SETLOCAL enableextensions enabledelayedexpansion
SET ProcessName="ShooterGame"
SET LogFile=D:\Apps\SystemInfo.log

TITLE Getting the current time...
REM ** Get the current time **
FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') DO SET "dt=%%a"
SET "YY=%dt:~2,2%" & SET "YYYY=%dt:~0,4%" & SET "MM=%dt:~4,2%" & SET "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & SET "Min=%dt:~10,2%" & SET "Sec=%dt:~12,2%"
SET "DateStamp=%YYYY%-%MM%-%DD%"
SET "TimeStamp=%HH%:%Min%:%Sec%"

TITLE Getting CPU Info...
FOR /f "usebackq delims== tokens=2" %%p in (`wmic CPU get LoadPercentage /format:value`) DO SET CPULoad=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic CPU get Name /format:value`) DO SET CPUName=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic CPU get NumberOfCores /format:value`) DO SET CPUCore=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic CPU get NumberOfLogicalProcessors /format:value`) DO SET CPULogical=%%p

TITLE Getting OS Information...
FOR /f "usebackq delims== tokens=2" %%p in (`wmic os get Caption /format:value`) DO SET OSName=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic os get Version /format:value`) DO SET OSVersion=%%p

TITLE Getting RAM Info...
FOR /f "usebackq delims== tokens=2" %%p in (`wmic os get FreePhysicalMemory /format:value`) DO SET FreePhysicalRAM=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic os get FreeVirtualMemory /format:value`) DO SET FreeVirtualRAM=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic os get TotalVirtualMemorySize /format:value`) DO SET TotalVirtualRAM=%%p
FOR /f "usebackq delims== tokens=2" %%p in (`wmic ComputerSystem get TotalPhysicalMemory /format:value`) DO SET TotalRAM=%%p

REM ** Change Total RAM from bytes to kilobytes to match FreePhysicalMemory **
SET TotalRAM=%TotalRAM:~0,-4%

TITLE Getting Process Count...
FOR /f "tokens=1 delims=" %%# IN ('qprocess^|find /i /c /n %ProcessName%') DO SET Instances=%%#

TITLE Getting C: Drive...
FOR /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='C:'" get Size /format:value`) DO SET DriveCTotal=%%x
FOR /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='C:'" get FreeSpace /format:value`) DO SET DriveCFree=%%x

TITLE Getting D: Drive...
FOR /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='D:'" get Size /format:value`) DO SET DriveDTotal=%%x
FOR /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='D:'" get FreeSpace /format:value`) DO SET DriveDFree=%%x

REM ** Log Results **
IF NOT EXIST %LogFile% ECHO DateStamp, TimeStamp, TotalRAM, FreePhysicalRAM, TotalVirtualRAM, FreeVirtualRAM, DriveCTotal, DriveCFree, DriveDTotal, DriveDFree, CPUName, CPUCore, CPULogical, CPULoad%%, ArkInstances, OSName, OSVersion > %LogFile%
ECHO %DateStamp%, %TimeStamp%, %TotalRAM%, %FreePhysicalRAM%, %TotalVirtualRAM%, %FreeVirtualRAM%, %DriveCTotal%, %DriveCFree%, %DriveDTotal%, %DriveDFree%, %CPUName%, %CPUCore%, %CPULogical%, %CPULoad%, %Instances%, %OSName%, %OSVersion% >> %LogFile%
