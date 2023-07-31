#broken gui for youtube-dl, stole most of the code from "remi" on stackOverflow


Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Yt-dlp mp4 audio Downloader'

$main_form.Width = 400
$main_form.Height = 200
$main_form.AutoSize = $true

#Creates a label and text box:
function New-TextBox($labelText, $x, $y, $w){
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $labelText
    $label.Location  = New-Object System.Drawing.Point($x, $y)
    $label.AutoSize = $true
    $main_form.Controls.Add($label)

    $textbox            = New-Object system.Windows.Forms.TextBox
    $textbox.multiline  = $false
    $textbox.width      = $w
    $textbox.height     = 20
    $textbox.location   = New-Object System.Drawing.Point(($x + 100), $y)
    $main_form.Controls.Add($textbox)

    return $textbox
}

#Creates a single label:
function New-Label($labelText, $x, $y, $w){

$label = New-Object System.Windows.Forms.Label
$label.Text = $labelText
$label.Location = New-Object System.Drawing.Point($x, $y)
$label.AutoSize = $true
$main_form.Controls.Add($label)





}

#Creates a button with $text as label:
function New-Button($text, $x, $y, $w, $h){
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Size($x, $y)
    $button.Size = New-Object System.Drawing.Size($w, $h)
    $button.Text = $text
    $button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $main_form.Controls.Add($button)
    return $button
}

$textBoxW = 200
$textBox2W = 25
$textBox3W = 25
$labelX = 0
$buttonX = $x + 100
$playlist = 0

$y = 10
$dy = 30

$buttonW = 25
$buttonH = 20

#Create 3 text boxes and buttons:
$textbox1 = New-TextBox "URL:" $labelX  $y $textBoxW
#$button1  = New-Button  "..."    $buttonX $y $buttonW $buttonH

$y = $y + $dy #select for playlist?
$textbox1 = New-Label "Playlist?: " $labelX  $y $textBoxW
$button1  = New-Button  ""    $buttonX $y $buttonW $buttonH

$y = $y + $dy + 10
$textbox2 = New-TextBox "Starting Video" $labelX  $y $textBox2W
#$button2  = New-Button  "..."    $buttonX $y $buttonW $buttonH
$y = $y + $dy
$textbox3 = New-TextBox "Ending Video" $labelX  $y $textBox2W
$y = $y + $dy
$buttonX = $buttonX + 70
$buttonW = $buttonW + 40
$button2  = New-Button  "Submit"    $buttonX $y $buttonW $buttonH

function Set-PlaylistButton($playlistButton){
    $playlistButton.Add_Click({
        $global:playlist = $true    
    })
}

#Set click event to button:
function Set-ButtonSubmit($submitButton, $playlist, $url, $playlistStart, $playlistEnd){
    $submitButton.Add_Click(
        {
            if (Set-PlaylistButton) {
                $command = ".\yt-dlp -c -x -f mp4 --playlist-start $playlistStart --playlist-end $playlistEnd $url"
            }
            else {
                $command = ".\yt-dlp -c -x -f mp4 $playlistEnd $url"
            }
            return $command
        }
    )
}
#Set-PlaylistButton $button1
Set-ButtonPlaylist $button2 $textbox1 $textbox2 $textbox3

#Set-ButtonPlaylist $button2 $textbox3
#Set-FileDialogButton $button3 $textbox3



$main_form.ShowDialog()