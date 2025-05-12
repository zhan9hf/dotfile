oh-my-posh init pwsh | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward