@ECHO OFF
REM #############################################################
REM Name          : GetInstalledPrograms.bat
REM Version       : 1.0
REM Date          : 2018-08-27
REM Author        : LHammonds
REM Purpose       : Create report of installed software.
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : As needed.
REM Reference     : http://www.techrepublic.com/forum/questions/101-215911/dos-command-to-list-all-installed-programs
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2018-08-27 1.0 LTH Created script.
REM #############################################################
SET TempDir=D:\Reports
SET RPTFile=%TempDir%\%COMPUTERNAME%_software_list.txt
SET TempFile1=%TempDir%\GetInstall1.txt
SET TempFile2=%TempDir%\GetInstall2.txt
ECHO =================================== > %RPTFile%
ECHO Software Listing for %COMPUTERNAME% >> %RPTFile%
ECHO =================================== >> %RPTFile%
REG.exe export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall %TempFile1%
find "DisplayName" %TempFile1%| find /V "ParentDisplayName" > %TempFile2%
for /f "tokens=2,3 delims==" %%a in (%TempFile2%) do (echo %%a >> %RPTFile%)
DEL /Q %TempFile1%
DEL /Q %TempFile2%
TYPE %RPTFile%
ECHO.
ECHO.
ECHO Installed software report stored in %RPTFile%
PAUSE
