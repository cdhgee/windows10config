Function Get-Description {

  [CmdletBinding()]
  Param()

  "Removing default apps"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  $applist = [xml](Get-Content -Path "$PSScriptRoot/config/default-apps.xml" -Encoding utf8)
  $applist."default-apps".app.name | Get-AppXPackage | Remove-AppXPackage
}

