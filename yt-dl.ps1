#working. Make sure ffmpeg.exe and yt-dlp.exe are in cwd

# Prompt the user for the first input using the Read-Host cmdlet
$OUT1 = Read-Host "Enter the YouTube URL "

# Show a message box with the first user input


# Prompt the user for the second input using the Read-Host cmdlet
$playlist = Read-Host "Is this a playlist link? Y or N"

if ($playlist -match 'Y'){

    $OUT2 = Read-Host "Enter the starting episode "
    $OUT3 = Read-Host "Enter the ending episode "
    .\yt-dlp -c -x -f mp4 --playlist-start $OUT1 --playlist-end $OUT3 $OUT1
}
else {
    .\yt-dlp -c -x -f mp4 $OUT1
}

