@ECHO OFF
REM #############################################################
REM Name          : LibreOffice-Uninstall.bat
REM Version       : 1.0
REM Date          : 2019-08-20
REM Author        : LHammonds
REM Purpose       : This removes associated file types and deletes the office folder.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : Right-click this file and "run as administrator" or file associations will not work.
REM Run Frequency : Run as needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2019-08-20 1.0 LTH Created script.
REM #############################################################
TITLE Uninstalling LibreOffice Portable
SET APPDIR=D:\Apps-Portable\LibreOfficePortable
FTYPE LibreOfficeText=
ASSOC .odt=
FTYPE LibreOfficeCalc=
ASSOC .ods=
FTYPE LibreOfficeBase=
ASSOC .odb=
FTYPE LibreOfficeDraw=
ASSOC .odg=
FTYPE LibreOfficeImpress=
ASSOC .odp=
FTYPE LibreOfficeMath=
ASSOC .odf=
IF EXIST %APPDIR%\LibreOfficeWriterPortable.exe GOTO DELAPP
GOTO DONE
:DELAPP
DEL /f /q /s %APPDIR%\*.* > NUL
RMDIR /q /s %APPDIR%
:DONE
SET APPDIR=
