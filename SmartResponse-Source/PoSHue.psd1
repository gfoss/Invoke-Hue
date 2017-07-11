﻿#
# Module manifest for module 'PoSHue'
#
# Generated by: Lewis Roberts
#
# Generated on: 27/04/2016
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PoSHue.ps1'

# Version number of this module.
ModuleVersion = '1.1.2'

# ID used to uniquely identify this module
GUID = '108d6567-bff6-4569-893f-36c4777d3def'

# Author of this module
Author = 'Lewis Roberts'

# Company or vendor of this module
# CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2016 Lewis Roberts. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Control your Philips Hue Bridge, Lights, Groups and Rooms with PowerShell'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @('System.Drawing')

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('hue', 'philips', 'lights')

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/lwsrbrts/PoSHue'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'With this module (classes!) you can control your Philips Hue Bridge, Lights, Groups and Rooms using PowerShell. Search for your Hue Bridge and get a passcode using pure PowerShell. Control state (on/off), brightness, colour (color!), saturation, temperature, alerting (quick on/off), recall scenes, create groups and rooms, convert RGB to Philips Hue colours (colors) using only PowerShell. Use the module to get notifications that you control, schedule weird and wonderful scenes and exert fine grain control over lights. This module is created as a set of PowerShell 5 classes with properties and methods. Please refer to the project site for simple to follow instructions (with pictures!) on how to use the classes.'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}