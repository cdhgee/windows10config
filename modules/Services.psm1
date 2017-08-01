Function Get-Description {

  [CmdletBinding()]
  Param()

  "Disabling services"

}

Function Set-Configuration {

  [CmdletBinding()]
  Param()

  $services = @("DiagTrack", "dmwappushservice", "HomeGroupListener", "HomeGroupProvider")

  $services | Get-Service | Stop-Service -PassThru | Set-Service -StartupType Disabled
}



