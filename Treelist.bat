@ECHO OFF
REM #############################################################
REM Name          : Treelist.bat
REM Version       : 1.0
REM Date          : 2020-06-04
REM Author        : LHammonds
REM Purpose       : Create a tree list of all drives but only 1 folder deep.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : https://jpsoft.com/help/tree.htm
REM Run Frequency : As needed.
REM NOTE          : Be sure to update the correct source and target paths before each run.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2020-02-22 1.0 LTH Created script.
REM #############################################################
SET LOGDIR=E:\Dropbox
SET TREEAPP=C:\Apps\TCC26\TCC.exe
%TREEAPP% /C TREE C:\ /S1 /A > %LOGDIR%\DriveC.txt
%TREEAPP% /C TREE D:\ /S1 /A > %LOGDIR%\DriveD.txt
%TREEAPP% /C TREE E:\ /S1 /A > %LOGDIR%\DriveE.txt
SET TREEAPP=
SET LOGDIR=
