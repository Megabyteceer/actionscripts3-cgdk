set APP_XML=application.xml
set APP_DIR=_bin
set FILE_OR_DIR=-C %APP_DIR% .
set AIR_PATH=air
set AIR_NAME=As3cgdk


%SystemRoot%\System32\find /C "<id>%APP_ID%</id>" "%APP_XML%" > NUL
if errorlevel 1 goto badid
goto end

:badid
echo.
echo ERROR: 
echo   Application ID in 'bat\SetupApplication.bat' (APP_ID) 
echo   does NOT match Application descriptor '%APP_XML%' (id)
echo.
if %PAUSE_ERRORS%==1 pause
exit

:end