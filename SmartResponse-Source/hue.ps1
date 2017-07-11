
  #====================================#
  # Hue IOT LogRhythm SmartResponse    #
  # LogRhythm Security Operations      #
  # greg . foss @ logrhythm . com      #
  # v0.1  --  April, 2017              #
  #====================================#

# Copyright 2017 LogRhythm Inc.   
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

<#

.INSTALL
PoSHue is required - download it here or install it via command line
    https://github.com/lwsrbrts/PoSHue
    PS C:\> Install-Module -Name PoSHue

.CONFIGURE
Install as a LogRhythm SmartResponse using the included LPI file

#>

[CmdLetBinding()]
param( 
    [string]$hueIPaddress,
    [string]$hueAPIkey,
    [string]$room,
    [string]$light,
    [string]$state
)

Import-Module PoSHue

$banner = @"
 _ _|                      |                  |   |              
   |   __ \ \ \   /  _ \   |  /   _ \         |   |  |   |   _ \ 
   |   |   | \ \ /  (   |    <    __/ _____|  ___ |  |   |   __/ 
 ___| _|  _|  \_/  \___/  _|\_\ \___|        _|  _| \__,_| \___| 
                                                                 
"@

    
if ( -Not $Bridge ) {
    $Bridge = [HueBridge]::New("$hueIPaddress", "$hueAPIkey")
}

if ( -Not $Group ) {
    $Group = [HueGroup]::New("$hueIPaddress", "$hueAPIkey")
        
}

if ( $room ) {
                
    $Group.GetLightGroup("$room") > $null
    $roomName = $Group.GroupClass

    if ( $state -eq "on" ) {
        $lightStatus = $Group.SwitchHueGroup('on')
        Write-Host ""
        Write-Host "==========================="
        Write-Host "Room lights in $room have been turned on"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "off" ) {
        $lightStatus = $Group.SwitchHueGroup('off')
        Write-Host ""
        Write-Host "==========================="
        Write-Host "Room lights in $room have been turned off"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "blue" ) {
        $lightStatus = $Group.SetHueGroup(150, 45500, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$room has been turned blue"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "red" ) {
        $lightStatus = $Group.SetHueGroup(150, 5, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$room has been turned red"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "bright" ) {
        $lightStatus = $Group.SetHueGroup(150, 35500, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$room has been set to bright white"
        Write-Host "==========================="
        Write-Host ""
    }
}

if ( $light ) {
        
    $lightBulbAscii
        
    $LightName = [HueLight]::New("$light", "$hueIPaddress", "$hueAPIkey")
    #$LightName.Light
        
    if ( $state -eq "on" ) {
        $lightStatus = $LightName.SwitchHueLight('on')
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$light has been turned on successfully"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "off" ) {
        $lightStatus = $LightName.SwitchHueLight('off')
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$light has been turned off successfully"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "blue" ) {
        $lightStatus = $LightName.SetHueLight(150, 45500, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$light has been turned blue"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "red" ) {
        $lightStatus = $LightName.SetHueLight(150, 5, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$light has been turned red"
        Write-Host "==========================="
        Write-Host ""
    }
    if ( $state -eq "bright" ) {
        $lightStatus = $LightName.SetHueLight(150, 35500, 150)
        Write-Host ""
        Write-Host "==========================="
        Write-Host "$light has been set to bright white"
        Write-Host "==========================="
        Write-Host ""
    }
}

Get-Variable | Remove-Variable -EA 0
