@ECHO OFF
REM #############################################################
REM Name          : Ark2Ext.bat
REM Version       : 1.0
REM Date          : 2020-08-22
REM Author        : LHammonds
REM Purpose       : Copy archives to external drive for ARK: Survival Evolved
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : Schedule as often as desired.
REM NOTE          : Be sure to update the correct path to the source and target ARK archives.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-08-22 1.0 LTH Created script.
REM #############################################################
TITLE Backing up files
SET SOURCEDIR=D:\Ark-Backup
SET TARGETDIR=E:\Ark-Backup
SET LOGDIR=C:\Apps\Log
SET DATESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TIMESTAMP=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DATEANDTIME=%DATESTAMP% %TIMESTAMP%
REM ** Copy the files **
ROBOCOPY "%SOURCEDIR%" "%TARGETDIR%" *.* /E /COPYALL /LOG+:%LOGDIR%\%DATESTAMP%-ext-backup.log /TEE /R:3 /W:1
REM ** Document which log files are older than 30 days **
ECHO Here is a list of old log files that will be purged: >> %LOGDIR%\%DATESTAMP%-ext-backup.log
forfiles /p "%LOGDIR%" /d -30 /c "cmd /c echo @path" >> %LOGDIR%\%DATESTAMP%-ext-backup.log
REM ** Purge log files older than 30 days **
forfiles /p "%LOGDIR%" /d -30 /c "cmd /c del @path"
SET DATEANDTIME=
SET TIMESTAMP=
SET DATESTAMP=
SET LOGDIR=
SET TARGETDIR=
SET SOURCEDIR=
