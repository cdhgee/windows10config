Function Get-Description {

  [CmdletBinding()]
  Param()

  "Applying UIsettings"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  # Show known file extensions
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0

  # Show hidden files
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 1

  # Change default Explorer view to "Computer"
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1
}
