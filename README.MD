
        Invoke-Hue
        PowerShell Philips Hue Integration
        greg . foss [at] logrhythm . com
        v0.1 -- July, 2017

## [About]

Leverage PoSHue to automate the discovery and interaction with Hue Lights.
This script is designed to integrate with the Loghythm SIEM, and change light color as alarms fire in the SOC.

Blog Post => https://logrhythm.com/blog/using-iot-and-smartresponse-to-recieve-siem-alarms/

![HueAlert](/images/hueAlarm.png)

## [Install]

		PoSHue is required - download it here or install it via command line
		    https://github.com/lwsrbrts/PoSHue
		    PS C:\> Install-Module -Name PoSHue

		Import the Invoke-Hue Module
			PS C:\> Import-Module .\Invoke-Hue.ps1

		Obtain an API key from the HUE Hub.
		Push the button on the top of the hub and then run the following command:
		    PS C:\> Invoke-Hue -hueIPaddress 10.10.10.10 -generateAPIkey

		Prepare HUE authentication and groups for use
			PS C:\> Invoke-Hue -generateAPIkey

## [Usage]

		Gather information on lights and rooms
		PS C:\> Invoke-Hue -lightInfo -hueIPaddress <ip> -hueAPIkey <key>

		Interact with the lights

		First, turn the light on:
		    PS C:\> Invoke-Hue -hueIPaddress <ip> -hueAPIkey <key> -room -on

		Then, change colors as desired:
		    PS C:\> Invoke-Hue -lightInfo -hueIPaddress <ip> -hueAPIkey <key> -red

## [License]

Copyright 2017 LogRhythm Inc.   
Licensed under the MIT License. See LICENSE file in the project root for full license information.
