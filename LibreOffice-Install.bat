@ECHO OFF
REM #############################################################
REM Name          : LibreOffice-Install.bat
REM Version       : 1.0
REM Date          : 2019-08-20
REM Author        : LHammonds
REM Purpose       : This copies the portable app to the local drive and associates file types to the program.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : Right-click this file and "run as administrator" or file associations will not work.
REM Run Frequency : Run as needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2019-08-20 1.0 LTH Created script.
REM #############################################################
TITLE Installing LibreOffice Portable
SET SRCDIR=\\srv-fileserver\software\Apps\LibreOfficePortable
SET APPDIR=D:\Apps-Portable\LibreOfficePortable
IF EXIST %APPDIR%\LibreOfficeWriterPortable.exe GOTO ASSC
MD %APPDIR%
XCOPY %SRCDIR%\*.* %APPDIR%\*.* /E /Y
:ASSC
ASSOC .odt=LibreOfficeText
FTYPE LibreOfficeText="%APPDIR%\LibreOfficeWriterPortable.exe" "%%1" %%*
ASSOC .ods=LibreOfficeCalc
FTYPE LibreOfficeCalc="%APPDIR%\LibreOfficeCalcPortable.exe" "%%1" %%*
ASSOC .odb=LibreOfficeBase
FTYPE LibreOfficeBase="%APPDIR%\LibreOfficeBasePortable.exe" "%%1" %%*
ASSOC .odg=LibreOfficeDraw
FTYPE LibreOfficeDraw="%APPDIR%\LibreOfficeDrawPortable.exe" "%%1" %%*
ASSOC .odp=LibreOfficeImpress
FTYPE LibreOfficeImpress="%APPDIR%\LibreOfficeImpressPortable.exe" "%%1" %%*
ASSOC .odf=LibreOfficeMath
FTYPE LibreOfficeMath="%APPDIR%\LibreOfficeMathPortable.exe" "%%1" %%*
SET APPDIR=
SET SRCDIR=
PAUSE
