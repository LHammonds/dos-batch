@ECHO OFF
REM #############################################################
REM Name          : ArkBakMods.bat
REM Version       : 1.0
REM Date          : 2021-03-27
REM Author        : LHammonds
REM Purpose       : Create timestamped archives of specific mods for ARK: Survival Evolved
REM Compatibility : Verified on to work on: Windows 10,2012
REM Requirements  : 7-Zip archive - https://www.7-zip.org/
REM Run Frequency : Schedule as often as desired.
REM NOTE #1: Make sure to update the variable paths to match your environment.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2021-03-27 1.0 LTH Created script.
REM #############################################################
SET MODDIR=C:\Steam\ARK\ShooterGame\Content\Mods
SET BAKDIR=C:\Bak
SET LOG=C:\Apps\ArkBakMods.log
SET ZIP=C:\Program Files\7-Zip\7z.exe
CLS
TITLE Backing up specific ARK mods
REM ** The target backup path can be anywhere you want or just set it to the same place as above.
FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
SET "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
ECHO %STRDATE% - Backup started. >> %LOG%
MKDIR "%BAKDIR%"
ECHO  - Backing up Ark mods to %BAKDIR%\%STRDATE%-ArkMods.7z >> %LOG%
CD /D "%MODDIR%"
"%ZIP%" a -t7z -mx9 %BAKDIR%\%STRDATE%-ArkMods.7z 1999447172* 1404697612* 895711211* 1262248217* 751991809* 1609138312*
SET STRDATE=
SET MODDIR=
SET BAKDIR=
SET LOG=
SET ZIP=
