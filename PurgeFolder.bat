@ECHO OFF
REM #############################################################
REM ## Name          : PurgeFolder.bat
REM ## Version       : 1.0
REM ## Date          : 2020-07-22
REM ## Author        : LHammonds
REM ## Purpose       : Purge all files/sub-folders in a specific folder.
REM ## Requirements  : If scheduled to run when nobody is logged in, be
REM ##                 sure to grant full folder/file permissions to the
REM ##                 user attached to the schedule.
REM ## Example       : cmd.exe /c D:\Apps\PurgeFolder.bat
REM ## Compatibility : Windows 2012 R2
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2020-07-22 1.0 LTH Created script.
REM #############################################################

TITLE Purge
SET DATESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TIMESTAMP=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DATEANDTIME=%DATESTAMP% %TIMESTAMP%
SET LOG=D:\Apps\PurgeFolder.log
SET SRCDIR=E:\TempLog

CLS

REM ** Log Purge **
ECHO %DATEANDTIME% - Starting purge for %SRCDIR% >> %LOG%

IF EXIST %SRCDIR% GOTO PURGEFILES
ECHO -- [ERROR] Folder not found - %SRCDIR% >> %LOG%
GOTO DONE

:PURGEFILES
REM ** Delete all files including those in all sub-folders (but not folders themselves) **
ECHO -- [INFO] Deleting all files in sub-folders... >> %LOG%
DEL /Q /F /S %SRCDIR%\*.*

REM ** Loop through all sub-folders and remove them. **

ECHO -- [INFO] Looping through sub-folders >> %LOG%

for /d %%f in (%SRCDIR%\*) do (
ECHO -- RD %%~nxf >> %LOG%
RMDIR /Q /S %%f
)

:DONE
ECHO %DATEANDTIME% - Completed purge. >> %LOG%
SET DATESTAMP=
SET TIMESTAMP=
SET DATEANDTIME=
SET LOG=
SET SRCDIR=
