@ECHO OFF
REM #############################################################
REM Name          : Ark2Dropbox.bat
REM Version       : 1.0
REM Date          : 2020-08-22
REM Author        : LHammonds
REM Purpose       : Copy latest archives to Dropbox for ARK: Survival Evolved
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : None
REM Run Frequency : Schedule as often as desired.
REM NOTE          : Be sure to update the correct path to the source and target ARK archives.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-08-22 1.0 LTH Created script.
REM #############################################################
TITLE Backing up files to Dropbox
SET DATESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
SET TIMESTAMP=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
SET DATEANDTIME=%DATESTAMP% %TIMESTAMP%
SET SOURCEDIR=D:\Ark-Backup
SET TARGETDIR=E:\Dropbox
SET LOGDIR=C:\Apps\Log
SET LOGFILE=%LOGDIR%\Ark2dropbox.log
MKDIR %TARGETDIR%\Archive
MKDIR %TARGETDIR%\Profiles
ECHO [INFO] %DATEANDTIME% Started script >> %LOGFILE%
ECHO Removing old archives from %TARGETDIR%\Archive\*.7z >> %LOGFILE%
DEL /Q %TARGETDIR%\Archive\*.7z
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Profiles\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Profiles\%NEWESTFILE%" %TARGETDIR%\Profiles\
ECHO Copied %TARGETDIR%\Profiles\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Aberration\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Aberration\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\CrystalIsles\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\CrystalIsles\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Extinction\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Extinction\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Genesis\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Genesis\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Island\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Island\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Ragnarok\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Ragnarok\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\ScorchedEarth\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\ScorchedEarth\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\Valguero\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\Valguero\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
FOR /f "delims=|" %%I IN ('DIR "%SOURCEDIR%\Archive\TheCenter\*.7z" /B /O:D') DO SET NEWESTFILE=%%I
XCOPY "%SOURCEDIR%\Archive\TheCenter\%NEWESTFILE%" %TARGETDIR%\Archive\
ECHO Copied %TARGETDIR%\Archive\%NEWESTFILE% >> %LOGFILE%
SET DATEANDTIME=
SET TIMESTAMP=
SET DATESTAMP=
SET LOGDIR=
SET TARGETDIR=
SET TEMPDIR=
SET SOURCEDIR=
