# Collects basic system + network info for Tier-1 troubleshooting
$stamp = Get-Date -Format "yyyyMMdd_HHmmss"
$outDir = "$PSScriptRoot\..\tickets\_diag_exports\$stamp"
New-Item -ItemType Directory -Path $outDir -Force | Out-Null

"=== SYSTEM INFO ===" | Out-File "$outDir\systeminfo.txt"
systeminfo | Out-File "$outDir\systeminfo.txt" -Append

"=== IP CONFIG ===" | Out-File "$outDir\network.txt"
ipconfig /all | Out-File "$outDir\network.txt" -Append

"=== ROUTE PRINT ===" | Out-File "$outDir\network.txt" -Append
route print | Out-File "$outDir\network.txt" -Append

"=== DNS CACHE ===" | Out-File "$outDir\network.txt" -Append
ipconfig /displaydns | Out-File "$outDir\network.txt" -Append

"=== WIFI PROFILES ===" | Out-File "$outDir\wifi.txt"
netsh wlan show profiles | Out-File "$outDir\wifi.txt" -Append

"=== RECENT SYSTEM EVENTS (last 50) ===" | Out-File "$outDir\events.txt"
Get-WinEvent -LogName System -MaxEvents 50 | Format-Table TimeCreated, Id, LevelDisplayName, ProviderName, Message -Wrap |
  Out-File "$outDir\events.txt"

Write-Host "Diagnostics exported to: $outDir"
