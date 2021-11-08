<#
Name: Stefan Torres
Documentation: 
    1. https://docs.microsoft.com/en-us/azure/active-directory/devices/manage-stale-devices

Purpose: To remove stale devices from AzureAD.

#>

# Set Dates For Disable & Delete
$disableDate = (Get-Date).AddDays(-30)
$deleteDate = (Get-Date).AddDays(-45)

# Get Devices
$devices = Get-AzureADDevice -All:$True

# Devices to Disable
# $devicesToDisable | Where {$_.ApproximateLastLogonTimeStamp -le $disableDate}