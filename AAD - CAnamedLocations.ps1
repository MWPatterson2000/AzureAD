<#
    .SYNOPSIS
    Exports all Azure AD Conditional Access Names Locations
    
    .DESCRIPTION
    Exports all Azure AD Conditional Access Names Locations into a CSV file in c:\Temp
	Requires M365 account account with atleast Security Reader role
    	Dependant on Azure AD PowerShell modulee
    
    #>
    
# Export File
$exportFile = "C:\Temp\$(Get-Date -Format yyyy-MM-dd-HH-mm) - AAD - CA namedLocations.csv"

#Get Conditional Access Policies   
$tempAR = @(Get-AzureADMSNamedLocationPolicy)

# Build Array for output
#$Script:NamedLocations = @()
$Script:NamedLocations = [System.Collections.ArrayList]::new()

# Build Export Array
$count = @(($tempAR).Displayname).Count
$count = $count - 1
for ($num = 0 ; $num -le $count ; $num++) {
    $tempIP = (($tempAR[$num]).IpRanges).cidrAddress -join ','
    $tempCR = (($tempAR[$num]).IpRanges).CountriesAndRegions -join ','
    $tempIUCR = (($tempAR[$num]).IpRanges).IncludeUnknownCountriesAndRegions -join ','
    #$Script:NamedLocations += New-Object PSobject -Property @{
    $NamedLocationsT = New-Object PSobject -Property @{
        "Displayname"  = ($tempAR[$num]).displayName
        "isTrusted" = ($tempAR[$num]).isTrusted
        "ID"  = ($tempAR[$num]).id
        "ipRanges" = $tempIP
        "CountriesAndRegions" = $tempCR
        "IncludeUnknownCountriesAndRegions" = $tempIUCR
    }
    [void]$Script:NamedLocations.Add($NamedLocationsT)
}

# Export Data
$Script:NamedLocations | export-csv -Path $exportFile -NoTypeInformation
