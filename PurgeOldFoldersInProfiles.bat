@ECHO OFF
REM #############################################################
REM ## Name          : PurgeOldFoldersInProfiles.bat
REM ## Version       : 1.0
REM ## Date          : 2023-01-05
REM ## Author        : LHammonds
REM ## Purpose       : Purge all sub-folders older than or equal to X days old.
REM ## Requirements  : If scheduled to run when nobody is logged in, be
REM ##                 sure the user running the task is SYSTEM.
REM ## Example       : cmd.exe /c C:\Apps\PurgeOldFoldersInProfiles.bat
REM ## Compatibility : Windows 10/11/2012
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2023-01-05 1.0 LTH Created script.
REM #############################################################

TITLE Purge Folders
REM ## This variable controls which day in the past it will start purging on.
REM ## DaysEqualTo being set to 4 will purge folders equal to 4 days go and older.
SET DaysEqualTo=1
SET DateStamp=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TimeStamp=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DateAndTime=%DateStamp% %TimeStamp%
SET LogFile=C:\Apps\PurgeOldFoldersInProfiles.log
SET RootDir=%SystemDrive%\Users
SET PurgeDir=AppData\LocalLow\AMICAS\cache
CLS
REM ** Log Purge **
ECHO %DateAndTime% - Starting purge of %RootDir%\*\%PurgeDir% (DaysEqualTo=%DaysEqualTo%) >> %LogFile%
FOR /D %%i IN (%RootDir%\*) DO (
  REM ** Delete all files including those in all sub-folders older than or equal to X days (but not the source folder itself) **
  ECHO -- [INFO] Deleting sub-folders in %%i\%PurgeDir% >> %LogFile%
  CD /D %%i
  FORFILES /D -%DaysEqualTo% /P "%%i\%PurgeDir%" /C "cmd /c IF @isdir == TRUE rd /S /Q @path" >> %LogFile%
)
ECHO %DateAndTime% - Completed purge. >> %LogFile%
SET PurgeDir=
SET RootDir=
SET LogFile=
SET DateAndTime=
SET TimeStamp=
SET DateStamp=
SET DaysEqualTo
