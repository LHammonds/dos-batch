@ECHO OFF
REM #############################################################
REM Name          : ArkSPBackup.bat
REM Version       : 1.0
REM Date          : 2020-07-18
REM Author        : LHammonds
REM Purpose       : Create timestamped backup archives of singleplayer savegames for ARK: Survival Evolved
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : 7-Zip archive - https://www.7-zip.org/
REM Run Frequency : Schedule as often as desired.
REM NOTE #1       : Be sure to update the correct path to ARK and where you want the savegames for ARKDIR and BAKDIR.
REM NOTE #2       : Make sure to update the path to the 7-Zip executable to match your installation.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-07-18 1.0 LTH Created script.
REM #############################################################
CLS
TITLE Backing up ARK Savegames
REM ** Correctly set this path to match your installation.
SET ARKDIR=D:\Steam\ARK\ShooterGame\Saved
REM ** The target backup path can be anywhere you want or just set it to the same place as above.
SET BAKDIR=E:\Ark-Backup
SET ZIP=C:\Program Files\7-Zip\7z.exe
FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
SET "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

:ISLAND
IF NOT EXIST "%ARKDIR%\SavedArksLocal\TheIsland.ark" GOTO SCORCHEDEARTH
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Island.7z %ARKDIR%\SavedArksLocal\TheIsland.ark %ARKDIR%\SavedArksLocal\*.arktribe %ARKDIR%\SavedArksLocal\*.arkprofile

:SCORCHEDEARTH
IF NOT EXIST "%ARKDIR%\ScorchedEarth_PSavedArksLocal\ScorchedEarth_P.ark" GOTO ABERRATION
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-ScorchedEarth.7z %ARKDIR%\ScorchedEarth_PSavedArksLocal\ScorchedEarth_P.ark %ARKDIR%\ScorchedEarth_PSavedArksLocal\*.arktribe %ARKDIR%\ScorchedEarth_PSavedArksLocal\*.arkprofile

:ABERRATION
IF NOT EXIST "%ARKDIR%\Aberration_PSavedArksLocal\Aberration_P.ark" GOTO EXTINCTION
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Aberration.7z %ARKDIR%\Aberration_PSavedArksLocal\Aberration_P.ark %ARKDIR%\Aberration_PSavedArksLocal\*.arktribe %ARKDIR%\Aberration_PSavedArksLocal\*.arkprofile

:EXTINCTION
IF NOT EXIST "%ARKDIR%\ExtinctionSavedArksLocal\Extinction.ark" GOTO GENESIS
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Extinction.7z %ARKDIR%\ExtinctionSavedArksLocal\Extinction.ark %ARKDIR%\ExtinctionSavedArksLocal\*.arktribe %ARKDIR%\ExtinctionSavedArksLocal\*.arkprofile

:GENESIS
IF NOT EXIST "%ARKDIR%\GenesisSavedArksLocal\Genesis.ark" GOTO CENTER
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Genesis.7z %ARKDIR%\GenesisSavedArksLocal\Extinction.ark %ARKDIR%\GenesisSavedArksLocal\*.arktribe %ARKDIR%\GenesisSavedArksLocal\*.arkprofile

:CENTER
IF NOT EXIST "%ARKDIR%\TheCenterSavedArksLocal\TheCenter.ark" GOTO RAGNAROK
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Center.7z %ARKDIR%\TheCenterSavedArksLocal\TheCenter.ark %ARKDIR%\TheCenterSavedArksLocal\*.arktribe %ARKDIR%\TheCenterSavedArksLocal\*.arkprofile

:RAGNAROK
IF NOT EXIST "%ARKDIR%\RagnarokSavedArksLocal\Ragnarok.ark" GOTO VALGUERO
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Ragnarok.7z %ARKDIR%\RagnarokSavedArksLocal\Ragnarok.ark %ARKDIR%\RagnarokSavedArksLocal\*.arktribe %ARKDIR%\RagnarokSavedArksLocal\*.arkprofile

:VALGUERO
IF NOT EXIST "%ARKDIR%\Valguero_PSavedArksLocal\Valguero_P.ark" GOTO CRYSTALISLES
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-Valguero.7z %ARKDIR%\Valguero_PSavedArksLocal\Valguero_P.ark %ARKDIR%\Valguero_PSavedArksLocal\*.arktribe %ARKDIR%\Valguero_PSavedArksLocal\*.arkprofile

:CRYSTALISLES
IF NOT EXIST "%ARKDIR%\CrystalIslesSavedArksLocal\CrystalIsles.ark" GOTO DONE
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-CrystalIsles.7z %ARKDIR%\CrystalIslesSavedArksLocal\CrystalIsles.ark %ARKDIR%\CrystalIslesSavedArksLocal\*.arktribe %ARKDIR%\CrystalIslesSavedArksLocal\*.arkprofile

:DONE
