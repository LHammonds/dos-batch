@ECHO OFF
REM #############################################################
REM Name          : acl_verify.bat
REM Version       : 1.0
REM Date          : 2016-03-31
REM Author        : LHammonds
REM Purpose       : Verifies file permissions from a saved backup.
REM Compatibility : Verified on to work on: Windows 2003,2008,2012
REM Requirements  : Right-click Run as Administrator
REM                 icacls.exe (comes with Windows 2003+)
REM Output        : acl_verify.log
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2016-03-31 1.0 LTH Created script.
REM #############################################################
TITLE ACL Verify
SET ACLFILE=E:\acl_save.acl
SET LOGFILE=E:\acl_verify.log
icacls /verify %ACLFILE% /T > %LOGFILE%
SET LOGFILE=
SET ACLFILE=
