@ECHO OFF
REM #############################################################
REM Name          : acl_save.bat
REM Version       : 1.0
REM Date          : 2016-03-31
REM Author        : LHammonds
REM Purpose       : Saves file permissions to a backup file.
REM Compatibility : Verified on to work on: Windows 2003,2008,2012
REM Requirements  : Right-click Run as Administrator
REM                 icacls.exe (comes with Windows 2003+)
REM Output        : acl_save.log
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-03-31 1.0 LTH Created script.
REM #############################################################
TITLE ACL Save
SET SOURCEDIR=D:\*
SET ACLFILE=E:\acl_save.acl
SET LOGFILE=E:\acl_save.log
icacls %SOURCEDIR% /save %ACLFILE% /T /C > %LOGFILE%
SET LOGFILE=
SET ACLFILE=
SET SOURCEDIR=
