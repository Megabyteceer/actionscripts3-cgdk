@echo off
set APP_ID=As3cgdk

call bat\SetupSDK.bat
call bat\SetupApplication.bat

echo.
echo Starting AIR Debug Launcher...
echo.

adl "%APP_XML%" "%APP_DIR%" -- %0 %1 %2 %3
if errorlevel 1 goto error
goto end

:error
pause

:end