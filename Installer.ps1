# Install Server-Media-Foundation without a reboot
Get-ChildItem "$Env:SystemRoot\Servicing\Packages\*Media*.mum" | ForEach-Object { (Get-Content $_) -replace 'required','no' | Set-Content $_}
Install-WindowsFeature Server-Media-Foundation
#
# Updated download link
(New-Object Net.WebClient).DownloadFile('https://downloads.plex.tv/plex-media-server-new/1.23.2.4600-f06057b33/windows/PlexMediaServer-1.23.2.4600-f06057b33-x86.exe', '\plex.exe')
#
# Install plex
.\plex.exe /quiet
#
# Delete installer
del .\plex.exe
powershell Clear-RecycleBin
