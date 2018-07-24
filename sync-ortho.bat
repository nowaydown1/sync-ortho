@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM
REM This is a simple batch script for Windows that will create symbolic directory links for your Ortho4XP
REM tiles. This is useful if you want to keep your Ortho scenery on a different drive than where your copy
REM of X-Plane is installed.  The script is designed to be placed inside your main X-Plane 11 folder (C:\X-Plane 11).
REM
REM Set the XPlaneInstallDirectory and Ortho4XPDirectory below to match your installation before running the script. 
REM
REM ----------- [ USER CONFIG ] -----------
SET "XPlaneInstallDirectory=C:\X-Plane 11"
SET "Ortho4XPDirectory=D:\Ortho4XP"
REM ---------------------------------------
REM
ECHO Checking for directories that need synchronization..
SET "CustomSceneryDirectory=%XPlaneInstallDirectory%\Custom Scenery"
CD /d %Ortho4XPDirectory%\Tiles
FOR /d %%G in ("zOrtho*") DO (
    SET "CurrentDirectory=%Ortho4XPDirectory%\Tiles\%%G"
    IF NOT EXIST "%XPlaneInstallDirectory%\Custom Scenery\%%G" (
        MKLINK /J "%XPlaneInstallDirectory%\Custom Scenery\%%G" "!CurrentDirectory!"
    ) 
)
CD /d %XPlaneInstallDirectory%
IF NOT EXIST "%XPlaneInstallDirectory%\Custom Scenery\yOrtho4XP_Overlays" (
    MKLINK /J "%XPlaneInstallDirectory%\Custom Scenery\yOrtho4XP_Overlays" "%Ortho4XPDirectory%\yOrtho4XP_Overlays"
)
ECHO Synchronization complete.
PAUSE