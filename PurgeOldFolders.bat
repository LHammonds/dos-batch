@ECHO OFF
REM #############################################################
REM ## Name          : PurgeOldFolders.bat
REM ## Version       : 1.0
REM ## Date          : 2020-08-31
REM ## Author        : LHammonds
REM ## Purpose       : Purge all sub-folders older than or equal to X days old.
REM ## Requirements  : If scheduled to run when nobody is logged in, be
REM ##                 sure to grant full folder/file permissions to the
REM ##                 user attached to the schedule.
REM ## Example       : cmd.exe /c D:\Apps\PurgeOldFolders.bat
REM ## Compatibility : Windows 10/2012
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2020-08-31 1.0 LTH Created script.
REM #############################################################

TITLE Purge Folders
REM ## This variable controls which day in the past it will start purging on.
REM ## DaysEqualTo being set to 4 will purge folders equal to 4 days go and older.
SET DaysEqualTo=4
SET DateStamp=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TimeStamp=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DateAndTime=%DateStamp% %TimeStamp%
SET LOG=D:\Apps\PurgeOldFolders.log
SET SRCDIR=E:\OldFolders
CLS
REM ** Log Purge **
ECHO %DateAndTime% - Starting purge of %SRCDIR% (DaysEqualTo=%DaysEqualTo%) >> %LOG%
IF EXIST %SRCDIR% GOTO PURGEFOLDERS
ECHO -- [ERROR] Folder not found - %SRCDIR% >> %LOG%
GOTO DONE

:PURGEFOLDERS
REM ** Delete all files including those in all sub-folders older than or equal to X days (but not the source folder itself) **
ECHO -- [INFO] Deleting sub-folders... >> %LOG%
CD /D %SRCDIR%
FORFILES /D -%DaysEqualTo% /P "%SRCDIR%" /C "cmd /c IF @isdir == TRUE rd /S /Q @path"

:DONE
ECHO %DateAndTime% - Completed purge. >> %LOG%
SET DateStamp=
SET TimeStamp=
SET DateAndTime=
SET LOG=
SET SRCDIR=
SET DaysEqualTo
