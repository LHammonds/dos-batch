@ECHO OFF
REM #############################################################
REM ## Name          : Create_URL_Shortcut.bat
REM ## Version       : 1.0
REM ## Date          : 2005-05-12
REM ## Author        : LHammonds
REM ## Purpose       : Create a shortcut URL
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ------------------------------------------
REM 2005-05-12 1.0 LTH Created script.
REM #############################################################
SET TEMPFILE="intranet.txt"
SET URLFILE="intranet.url"
SET URL="http://intranet/"
SET TARGETDIR="%USERPROFILE%\desktop"

ECHO [DEFAULT] >> "%TEMP%\%TEMPFILE%"
ECHO BASEURL=%URL% >> "%TEMP%\%TEMPFILE%"
ECHO [InternetShortcut] >> "%TEMP%\%TEMPFILE%"
ECHO URL=%URL% >> "%TEMP%\%TEMPFILE%"
RENAME "%TEMP%\%TEMPFILE%" "%URLFILE%"
COPY "%TEMP%\%URLFILE%" "%TARGETDIR%\%URLFILE%"
DEL "%TEMP%\%URLFILE%"

SET TARGETDIR=
SET URL=
SET URLFILE=
SET TEMPFILE=
