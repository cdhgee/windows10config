Function Get-Description {

  [CmdletBinding()]
  Param()

  "Applying search and Cortana settings"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  # Disable Cortana
  If (!(Test-Path "HKCU:\Software\Microsoft\Personalization\Settings")) {
      New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force | Out-Null
  }
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
  If (!(Test-Path "HKCU:\Software\Microsoft\InputPersonalization")) {
      New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
  }
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
  If (!(Test-Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore")) {
      New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
  }
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0

  # Disable Bing Search in Start Menu
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
}


