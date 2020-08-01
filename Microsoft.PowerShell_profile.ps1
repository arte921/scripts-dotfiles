function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  $host.ui.RawUI.WindowTitle = $p
  "$p > "
}

Set-PSReadlineKeyHandler -Key Tab -Function Complete
