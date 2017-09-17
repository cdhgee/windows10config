Function Get-Description {

  [CmdletBinding()]
  Param()

  "Removing default apps"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  Get-Setting -Name "default apps" | Get-AppXPackage | Remove-AppXPackage
}

