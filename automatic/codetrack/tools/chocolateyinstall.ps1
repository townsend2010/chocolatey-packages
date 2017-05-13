﻿$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName = $env:chocolateyPackageName
  destination = $toolsDir
  file        = "$toolsDir\"
}
Get-ChocolateyUnzip @packageArgs

$startMenu = [System.Environment]::GetFolderPath('Programs')
$target = "$toolsDir\CodeTrack.exe"
New-Item -ItemType File -Path "$target.gui"
Install-ChocolateyShortcut "$startMenu\CodeTrack.lnk" -TargetPath $target

Remove-Item $packageArgs.file -Force -ea 0
