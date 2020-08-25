@ECHO OFF
REM #############################################################
REM Name          : acl_restore.bat
REM Version       : 1.0
REM Date          : 2016-03-31
REM Author        : LHammonds
REM Purpose       : Restore file permissions from a saved backup.
REM Compatibility : Verified on to work on: Windows 2003,2008,2012
REM Requirements  : Right-click Run as Administrator
REM                 icacls.exe (comes with Windows 2003+)
REM Output        : acl_restore.log
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-03-31 1.0 LTH Created script.
REM #############################################################
TITLE ACL Restore
SET RESTOREPATH=D:\
SET ACLFILE=E:\acl_save.acl
SET LOGFILE=E:\acl_restore.log
CLS
ECHO.
ECHO There is a trick to restoring the root folder using icacls that is not known very-well.
ECHO.
ECHO If you try to restore a root level save, it will fail with invalid path message.
ECHO.
ECHO To correct this, edit the save file and remove the 1st line which should be blank (.) which
ECHO.
ECHO signifies the "current directory" and should then process the root from then on.
ECHO.
ECHO If you need to edit the file, press CTRL+C to break out of the batch file.
ECHO.
PAUSE
icacls %RESTOREPATH% /restore %ACLFILE% > %LOGFILE%
SET LOGFILE=
SET ACLFILE=
SET RESTOREPATH=
