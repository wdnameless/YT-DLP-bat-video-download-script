@echo off

REM Prompt for the video URL
set /p URL=Enter the URL of the video on YouTube: 

REM Prompt for the save path
set /p SAVE_PATH=Enter the path to save the video: 

REM Check if the save path exists
if not exist "%SAVE_PATH%" mkdir "%SAVE_PATH%"

REM Inform the user about the start of the download
echo Downloading video...

REM Change to the save directory
cd /D "%SAVE_PATH%"

REM Execute the command to download the video
yt-dlp.exe --output "%%(title)s.%%(ext)s" -- "%URL%"

REM Check if the download was successful
if %ERRORLEVEL% equ 0 (
    echo Video successfully downloaded!
) else (
    echo An error occurred during the download of the video.
)

REM Wait for a key press to close the window
pause
