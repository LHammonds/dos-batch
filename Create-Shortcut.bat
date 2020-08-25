@ECHO OFF
REM #############################################################
REM Name          : Create_Shortcut.bat
REM Version       : 1.0
REM Date          : 2016-09-04
REM Author        : LHammonds
REM Purpose       : Create a URL shortcut and place it on the desktop.
REM Compatibility : Verified on to work on: Windows 7,10,2000,2003,2008,2012
REM Requirements  : None
REM Run Frequency : As needed.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2016-09-04 1.0 LTH Created script.
REM #############################################################

SET VBFILE="%TEMP%\CreateShortcut.vbs"
SET FILENAME=websearch.lnk
SET URLPATH=https://www.duckduckgo.com/

ECHO Set obj_shell = WScript.CreateObject("WScript.Shell") >> %VBFILE%
ECHO str_system = obj_shell.ExpandEnvironmentStrings("%windir%") >> %VBFILE%
ECHO str_desktop = obj_shell.SpecialFolders("Desktop") >> %VBFILE%
ECHO str_filename = "%FILENAME%" >> %VBFILE%
ECHO Set obj_link = obj_shell.CreateShortcut(str_desktop + "\" + str_filename) >> %VBFILE%
ECHO obj_link.TargetPath = "%URLPATH%" >> %VBFILE%
ECHO obj_link.IconLocation = str_system + "\System32\shell32.dll, 91" >> %VBFILE%
rem ECHO obj_link.IconLocation = str_system + "\System32\moricons.dll, 61" >> %VBFILE%
rem ECHO obj_link.Arguments = "" >> %VBFILE%
rem ECHO obj_link.Description = "" >> %VBFILE%
rem ECHO obj_link.WindowsStyle = 4 >> %VBFILE%
rem ECHO obj_link.WorkingDirectory = "" >> %VBFILE%
ECHO obj_link.Save >> %VBFILE%

CSCRIPT.exe /nologo %VBFILE%
DEL %VBFILE%
SET URLPATH=
SET FILENAME=
SET VBFILE=
