[CmdletBinding()]
Param()

Function main {

  $script:basepath = (Get-Location).Path
  $modules = Get-ChildItem -Path "$($script:basepath)/modules" -Filter "*.psm1"

  Foreach($module in $modules){
    Import-Module -Name $module.FullName -Prefix $module.BaseName
  }

  Foreach($module in $modules){
    $msg = Invoke-ModuleFunction -Module $module.Basename -Function "Get-Description"
    Write-Host $msg
  }
  

}

Function Invoke-ModuleFunction {

  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    $Module,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    $Function
  )

  $verb, $rest = $Function -split "-"
  $reststring = $rest -join "-"
  & "$verb-$Module$reststring"
}

main
