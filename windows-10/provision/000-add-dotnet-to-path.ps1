$regPath = "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$hklm    = [Microsoft.Win32.Registry]::LocalMachine

Function Add-FolderToPath {
    Param
        (
         [Parameter(Mandatory=$true, ValueFromPipeline=$True, Position=0)]
         [string] $Folder
        )

    Write-Verbose "Adding folder ""$Folder"" to SYSTEM path"

    #get the current search path from the environment keys in the registry.
    $regKey  = $hklm.OpenSubKey($regPath, $FALSE)
    [string]$OldPath = $regKey.GetValue("Path", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)

    #see if the new Folder is already in the path.
    IF ($OldPath | Select-String -SimpleMatch $Folder) {
        Write-Warning "Folder ""$Folder"" is already in the path"
    } else {
        #set the New Path
        $NewPath = $OldPath+ ’;’ + $Folder
        $regKey = $hklm.OpenSubKey($regPath, $True)
        $regKey.SetValue("Path", $NewPath, [Microsoft.Win32.RegistryValueKind]::ExpandString)

        #show our results back to the world
        Return $NewPath
    }
}

Add-FolderToPath "C:\Windows\Microsoft.NET\Framework\v4.0.30319"
