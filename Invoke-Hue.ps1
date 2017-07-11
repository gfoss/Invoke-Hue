
  #====================================#
  # Hue IoT - LogRhythm SmartResponse  #
  # LogRhythm Security Operations      #
  # greg . foss @ logrhythm . com      #
  # v0.1  --  July, 2017               #
  #====================================#

# Copyright 2017 LogRhythm Inc.   
# Licensed under the MIT License. See LICENSE file in the project root for full license information.


function Invoke-Hue {

<#

.INSTALL
PoSHue is required - download it here or install it via command line
    https://github.com/lwsrbrts/PoSHue
    PS C:\> Install-Module -Name PoSHue

.CONFIGURE
Import the module and obtain an API key from the HUE Hub.
Push the button on the top of the hub and then run the following command:
    PS C:\> Invoke-Hue -hueIPaddress 10.10.10.10 -generateAPIkey

.SYNOPSIS
Prepare HUE authentication and groups for use
PS C:\> Invoke-Hue -generateAPIkey

.SYNOPSIS
Gather information on lights and rooms
PS C:\> Invoke-Hue -lightInfo -hueIPaddress <ip> -hueAPIkey <key>

.SYNOPSIS
Interact with the lights

First, turn the light on:
    PS C:\> Invoke-Hue -hueIPaddress <ip> -hueAPIkey <key> -room -on
Then, change colors as desired:
    PS C:\> Invoke-Hue -lightInfo -hueIPaddress <ip> -hueAPIkey <key> -red

#>

    [CmdLetBinding()]
    param( 
        [string]$hueIPaddress,
        [string]$hueAPIkey,
        [string]$room,
        [string]$light,

        [switch]$generateAPIkey,
        [switch]$lightInfo,
        [switch]$on,
        [switch]$off,
        [switch]$blue,
        [switch]$red,
        [switch]$bright
    )

$banner = @"
 _ _|                      |                  |   |              
   |   __ \ \ \   /  _ \   |  /   _ \         |   |  |   |   _ \ 
   |   |   | \ \ /  (   |    <    __/ _____|  ___ |  |   |   __/ 
 ___| _|  _|  \_/  \___/  _|\_\ \___|        _|  _| \__,_| \___| 
                                                                 
"@

if ( $off -eq $true ) {
    $lightBulbAscii = @"

               _...._
             .'      '.
            /          \
            |          |
             \   ~~   /
              '\ || /'
               |_||_|
               {____}
               {____}
                [()]
"@
} else {
    $lightBulbAscii = @"

                  |
          .    _...._    .
           \ .'      '. /
            /          \
      - ___ |          | ___ -
             \   ~~   /
            / '\ || /' \
           .   |_||_|   .
               {____}
               {____}
                [()]
"@
}

    # Connect to the Hue Bridge and obtain an API key. Ensure you push the 
    if ( $generateAPIkey ) {
        
        Write-Host ""
        Write-Host $banner -foregroundcolor "green"

        [HueBridge]::FindHueBridge()
        try {
            $Bridge = [HueBridge]::New("$hueIPaddress")

            Write-Host ""
            Write-Host "Hue API Key Acquired:"
            Write-Host "=============================="
            Write-Host ""
            $Bridge.GetNewAPIKey()
            Write-Host ""
            Write-Host "=============================="
            Write-Host ""

            $hueAPIkey = $Bridge.APIKey
            $Bridge = [HueBridge]::New("$hueIPaddress", "$hueAPIkey")
        } catch {
            Write-Error "Ensure that you have placed the Hue Hub in discoverable mode"
        }
    }
    
    if ( -Not $Bridge ) {
        $Bridge = [HueBridge]::New("$hueIPaddress", "$hueAPIkey")
    }

    if ( -Not $Group ) {
        $Group = [HueGroup]::New("$hueIPaddress", "$hueAPIkey")
        
    }

    if ( $lightInfo ) {

        Write-Host ""
        Write-Host $banner -foregroundcolor "green"

        #$Bridge
        Write-Host ""
        Write-Host "Available Lights:" -foregroundcolor "gray"
        Write-Host "==============================" -foregroundcolor "gray"
        Write-Host ""
        #$Bridge.GetAllLights()
        $Bridge.GetLightNames()
        Write-Host ""
        Write-Host "==============================" -foregroundcolor "gray"

        #$Group
        Write-Host ""
        Write-Host "Available Rooms:" -foregroundcolor "gray"
        Write-Host "==============================" -foregroundcolor "gray"
        $Group.GetLightGroups()
        Write-Host "==============================" -foregroundcolor "gray"
        Write-Host ""

    }

    if ( $room ) {
        
        #$lightBulbAscii
        
        $Group.GetLightGroup("$room") > $null
        $roomName = $Group.GroupClass

        if ( $on -eq $true ) {
            $lightStatus = $Group.SwitchHueGroup('on')
            Write-Host $lightBulbAscii -foregroundcolor "yellow"
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "Room lights in $room have been turned on"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $off -eq $true ) {
            Write-Host $lightBulbAscii
            $lightStatus = $Group.SwitchHueGroup('off')
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "Room lights in $room have been turned off"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $blue ) {
            Write-Host $lightBulbAscii -foregroundcolor "cyan"
            $lightStatus = $Group.SetHueGroup(150, 45500, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$room has been turned blue"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $red ) {
            Write-Host $lightBulbAscii -foregroundcolor "red"
            $lightStatus = $Group.SetHueGroup(150, 5, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$room has been turned red"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $bright) {
            Write-Host $lightBulbAscii
            $lightStatus = $Group.SetHueGroup(150, 35500, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$room has been set to bright white"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
    }

    if ( $light ) {
        
        $lightBulbAscii
        
        $LightName = [HueLight]::New("$light", "$hueIPaddress", "$hueAPIkey")
        #$LightName.Light
        
        if ( $on -eq $true ) {
            $lightStatus = $LightName.SwitchHueLight('on')
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$light has been turned on successfully"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $off -eq $true ) {
            $lightStatus = $LightName.SwitchHueLight('off')
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$light has been turned off successfully"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $blue ) {
            $lightStatus = $LightName.SetHueLight(150, 45500, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$light has been turned blue"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $red ) {
            $lightStatus = $LightName.SetHueLight(150, 5, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$light has been turned red"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
        if ( $bright) {
            $lightStatus = $LightName.SetHueLight(150, 35500, 150)
            Write-Host ""
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host "$light has been set to bright white"
            Write-Host "==============================" -foregroundcolor "gray"
            Write-Host ""
        }
    }

Get-Variable | Remove-Variable -EA 0

}
