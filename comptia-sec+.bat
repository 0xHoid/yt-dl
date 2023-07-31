












@echo off 

powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Youtube URL:', 'YT-DL')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %OUT%', 'Hello');}"

powershell -Command %msgBoxArgs%

powershell -Command ".\yt-dlp -c -x -f mp4 --playlist-start 100 --playlist-end 101 %OUT% --verbose"



