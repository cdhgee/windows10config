[CmdletBinding()]
Param()

Function main {

  $script:basepath = (Get-Location).Path

  If (-not ([System.Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
  {   
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments -NoNewWindow
    Break
  }

  $modules = Get-ChildItem -Path "$($script:basepath)/modules" -Filter "*.psm1"

  Foreach($module in $modules){
    Import-Module -Name $module.FullName -Prefix $module.BaseName
  }

  Foreach($module in $modules){
    $msg = Invoke-ModuleFunction -Module $module.Basename -Function "Get-Description"
    Write-Host $msg
    Invoke-ModuleFunction -Module $module.Basename -Function "Set-Configuration"
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
