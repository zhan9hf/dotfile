oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1