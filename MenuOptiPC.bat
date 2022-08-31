:MENU_START
@echo off
cls
title "Menu Batch"
color b
set INPUT=false
set "MENU_OPTION="
echo +===============================================+
echo . Menu                                          .
echo +===============================================+
echo .                                               .
echo .  1) INFO SYSTEM                               .
echo .  2) PERF ALIMENTATION                         .
echo .  3) SUPRIMER ONE DRIVE 32-BITS                .
echo .  4) SUPPRIMER ONE DRIVE 64-BITS               .
echo .  5) SUPPRIMER FICHIER TEMPOTAIRE              .
echo .  6) INSTALATION DEBLOATER                     .
echo .  7) EXIT                                      .
echo +===============================================+
set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %MENU_OPTION%==4 GOTO OPTION4
IF %MENU_OPTION%==5 GOTO OPTION5
IF %MENU_OPTION%==6 GOTO OPTION6
IF %MENU_OPTION%==7 GOTO OPTION7

:OPTION1
SYSTEMINFO
timeout 15 > NUL

:OPTION2
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
timeout 2 > NUL
GOTO MENU_START

:OPTION3
echo preparation en cours ...
timeout 2
echo one drive est pret a etre desinstaller
timeout 5 > nul
%systemroot%\SysWOW32\OneDriveSetup.exe /uninstall
GOTO MENU_START

:OPTION4
echo preparation en cours ...
timeout 2
echo one drive est pret a etre desinstaller
%systemroot%\SysWOW64\OneDriveSetup.exe /uninstall
GOTO MENU_START


:OPTION7
set INPUT=true
echo Bye
timeout 2 > NUL
exit /b

:DEFAULT
echo Option not available
timeout 2 > NUL
GOTO MENU_START

:OPTION5
ECHO preparation de la supression des fichier temporaire en cours ...
Del "%SystemRoot%\System32\spool\printers\*.*" /F /Q /S 
Del "%Userprofile%\Local Settings\Temp\*.*" /F /Q /S
Del "%Userprofile%\Local Settings\Temporary Internet Files\*.*" /F /Q /S
Del "%systemdrive%\recycled\*.*" /F /Q /S
GOTO MENU_START

:OPTION6
echo le debloater a bien ete installer.
echo le debloater a bien ete lancer.
pause 5
md %Userprofile%\Desktop\Debloater
echo|set /p= "iwr -useb https://git.io/debloat|iex"> "%Userprofile%\Desktop\Debloater\debloater.ps1"
cd %Userprofile%\Documents\Script\Batch\OptiPC
powershell -executionpolicy bypass -File %Userprofile%\Desktop\Debloater\debloater.ps1
GOTO MENU_START



