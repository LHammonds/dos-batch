@ECHO OFF
REM #############################################################
REM Name          : ArkBackup.bat
REM Version       : 1.1
REM Date          : 2021-11-11
REM Author        : LHammonds
REM Purpose       : Create timestamped backup archives of server savegames for ARK: Survival Evolved
REM Compatibility : Verified on to work on: Windows 7,10,2012
REM Requirements  : 7-Zip archive - https://www.7-zip.org/
REM Run Frequency : Schedule as often as desired.
REM NOTE #1: Be sure to update the correct path to ARK and where you want the savegames for AMGDIR and BAKDIR.
REM NOTE #2: Make sure to update the path to the 7-Zip executable to match your installation.
REM ###################### CHANGE LOG ###########################
REM DATE       VER WHO WHAT WAS CHANGED
REM ---------- --- --- ---------------------------------------
REM 2020-08-22 1.0 LTH Created script.
REM 2021-11-11 1.1 LTH Added more maps and the *.arktributetribe filetype
REM #############################################################
CLS
TITLE Backing up ARK Savegames
REM ** The target backup path can be anywhere you want or just set it to the same place as above.
SET AMGDIR=C:\Users\ArkUser\Desktop\AMG\Server
SET BAKDIR=D:\Ark-Backup
SET LOG=C:\Apps\Log\ArkBackup.log
SET ZIP=C:\Program Files\7-Zip\7z.exe
FOR /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
SET "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
SET "STRDATE=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
ECHO %STRDATE% - Backup started. >> %LOG%
MKDIR %BAKDIR%\Archive
MKDIR %BAKDIR%\Profiles
ECHO  - Backing up AMG profiles to %BAKDIR%\Profiles\ >> %LOG%
"%ZIP%" a -t7z -mx9 %BAKDIR%\Profiles\%STRDATE%-Profiles.7z                 %AMGDIR%\Profiles\*.profile
ECHO  - Backing up ARK maps to %BAKDIR%\Archive\ >> %LOG%
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Aberration\%STRDATE%-Aberration.7z     %AMGDIR%\Servers\Aberration\ShooterGame\Saved\Aberration\Aberration_P.ark     %AMGDIR%\Servers\Aberration\ShooterGame\Saved\Aberration\*.arkprofile     %AMGDIR%\Servers\Aberration\ShooterGame\Saved\Aberration\*.arktribe     %AMGDIR%\Servers\Aberration\ShooterGame\Saved\Aberration\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\CrystalIsles\%STRDATE%-CrystalIsles.7z %AMGDIR%\Servers\CrystalIsles\ShooterGame\Saved\CrystalIsles\CrystalIsles.ark %AMGDIR%\Servers\CrystalIsles\ShooterGame\Saved\CrystalIsles\*.arkprofile %AMGDIR%\Servers\CrystalIsles\ShooterGame\Saved\CrystalIsles\*.arktribe %AMGDIR%\Servers\CrystalIsles\ShooterGame\Saved\CrystalIsles\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Desert\%STRDATE%-ScorchedEarth.7z      %AMGDIR%\Servers\Desert\ShooterGame\Saved\Desert\ScorchedEarth_P.ark          %AMGDIR%\Servers\Desert\ShooterGame\Saved\Desert\*.arkprofile             %AMGDIR%\Servers\Desert\ShooterGame\Saved\Desert\*.arktribe             %AMGDIR%\Servers\Desert\ShooterGame\Saved\Desert\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Extinction\%STRDATE%-Extinction.7z     %AMGDIR%\Servers\Extinction\ShooterGame\Saved\Exticion\Extinction.ark         %AMGDIR%\Servers\Extinction\ShooterGame\Saved\Exticion\*.arkprofile       %AMGDIR%\Servers\Extinction\ShooterGame\Saved\Exticion\*.arktribe       %AMGDIR%\Servers\Extinction\ShooterGame\Saved\Exticion\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Fjordur\%STRDATE%-Fjordur.7z           %AMGDIR%\Servers\Fjordur\ShooterGame\Saved\Fjordur\Viking_P.ark               %AMGDIR%\Servers\Fjordur\ShooterGame\Saved\Fjordur\*.arkprofile           %AMGDIR%\Servers\Fjordur\ShooterGame\Saved\Fjordur\*.arktribe           %AMGDIR%\Servers\Fjordur\ShooterGame\Saved\Fjordur\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Genesis1\%STRDATE%-Genesis1.7z         %AMGDIR%\Servers\Genesis1\ShooterGame\Saved\Genesis\Genesis.ark               %AMGDIR%\Servers\Genesis1\ShooterGame\Saved\Genesis\*.arkprofile          %AMGDIR%\Servers\Genesis1\ShooterGame\Saved\Genesis\*.arktribe          %AMGDIR%\Servers\Genesis1\ShooterGame\Saved\Genesis\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Genesis2\%STRDATE%-Genesis2.7z         %AMGDIR%\Servers\Genesis2\ShooterGame\Saved\Gen2\Gen2.ark                     %AMGDIR%\Servers\Genesis2\ShooterGame\Saved\Gen2\*.arkprofile             %AMGDIR%\Servers\Genesis2\ShooterGame\Saved\Gen2\*.arktribe             %AMGDIR%\Servers\Genesis2\ShooterGame\Saved\Gen2\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Island\%STRDATE%-Island.7z             %AMGDIR%\Servers\Island\ShooterGame\Saved\Island\TheIsland.ark                %AMGDIR%\Servers\Island\ShooterGame\Saved\Island\*.arkprofile             %AMGDIR%\Servers\Island\ShooterGame\Saved\Island\*.arktribe             %AMGDIR%\Servers\Island\ShooterGame\Saved\Island\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\LostIsland\%STRDATE%-LostIsland.7z     %AMGDIR%\Servers\LostIsland\ShooterGame\Saved\LostIsland\LostIsland.ark       %AMGDIR%\Servers\LostIsland\ShooterGame\Saved\LostIsland\*.arkprofile     %AMGDIR%\Servers\LostIsland\ShooterGame\Saved\LostIsland\*.arktribe     %AMGDIR%\Servers\LostIsland\ShooterGame\Saved\LostIsland\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Ragnarok\%STRDATE%-Ragnarok.7z         %AMGDIR%\Servers\Ragnarok\ShooterGame\Saved\Ragnarok\Ragnarok.ark             %AMGDIR%\Servers\Ragnarok\ShooterGame\Saved\Ragnarok\*.arkprofile         %AMGDIR%\Servers\Ragnarok\ShooterGame\Saved\Ragnarok\*.arktribe         %AMGDIR%\Servers\Ragnarok\ShooterGame\Saved\Ragnarok\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\TheCenter\%STRDATE%-TheCenter.7z       %AMGDIR%\Servers\TheCenter\ShooterGame\Saved\TheCenter\TheCenter.ark          %AMGDIR%\Servers\TheCenter\ShooterGame\Saved\TheCenter\*.arkprofile       %AMGDIR%\Servers\TheCenter\ShooterGame\Saved\TheCenter\*.arktribe       %AMGDIR%\Servers\TheCenter\ShooterGame\Saved\TheCenter\*.arktributetribe
"%ZIP%" a -t7z -mx9 %BAKDIR%\Archive\Valguero\%STRDATE%-Valguero.7z         %AMGDIR%\Servers\Valguero\ShooterGame\Saved\Valguero\Valguero_P.ark           %AMGDIR%\Servers\Valguero\ShooterGame\Saved\Valguero\*.arkprofile         %AMGDIR%\Servers\Valguero\ShooterGame\Saved\Valguero\*.arktribe         %AMGDIR%\Servers\Valguero\ShooterGame\Saved\Valguero\*.arktributetribe
