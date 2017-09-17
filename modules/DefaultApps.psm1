Function Get-Description {

  [CmdletBinding()]
  Param()

  "Removing default apps"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  Get-Setting -Name "default apps" | Select -ExpandProperty Value | Get-AppXPackage | Remove-AppXPackage
}

