@echo off
setlocal enabledelayedexpansion

rem Set source and destination directories
set "source_dir=%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
set "dest_dir=.\wallpapers"

rem Check if the destination directory exists, if not, create it
if not exist "%dest_dir%" (
    mkdir "%dest_dir%"
)

rem Get the current timestamp
rem for /f "tokens=1-4 delims=/- " %%a in ('date /t') do set DATE=%%d-%%b-%%c
rem for /f "tokens=1-4 delims=:. " %%a in ('time /t') do set TIME=%%a%%b%%c%%d

rem Iterate over all files in the source directory
for %%f in ("%source_dir%\*") do (
    rem Get the filename and extension
    set "filename=%%~nf"
    rem set "extension=%%~xf"
    set "extension=.jpg"

    rem Construct the new filename with timestamp
    set "new_filename=!filename!!extension!"

    rem Copy the file to the destination directory with the new name
    copy "%%f" "%dest_dir%\!new_filename!"
    
    echo !new_filename!
)

echo All files have been copied and renamed.
pause