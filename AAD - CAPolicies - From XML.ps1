function Get-CAPolicies {
    #Get Conditional Access Policies
    #$tempAR = @(Get-AzureADMSConditionalAccessPolicy)
    #$tempAR = @(Import-Clixml -Path "C:\Users\MikePatterson\OneDrive - CloudFit Software\M365Compliance\CAPolicies.xml")
    # Build Array for output
    $Script:CAPolicies = [System.Collections.ArrayList]::new()
    $Script:CAPoliciesCount = @(($tempAR).Displayname).Count
    # Build Export Array
    #$count = @(($tempAR).Displayname).Count
    #if ($count -ne 0) {
    $count = @($tempAR).Count
    if ($count -gt 0) {
        $count = $count - 1
        for ($num = 0 ; $num -le $count ; $num++) {
            $Displayname = ($tempAR[$num]).displayName -join ','
            $State = ($tempAR[$num]).state -join ','
            $ID = ($tempAR[$num]).id -join ','
            $createdDateTime = ($tempAR[$num]).createdDateTime -join ','
            $ModifiedDateTime = ($tempAR[$num]).ModifiedDateTime -join ','
            $sessionControls = ($tempAR[$num]).sessionControls -join ','
            $userRiskLevels = (($tempAR[$num]).conditions).userRiskLevels -join ','
            $signInRiskLevels = (($tempAR[$num]).conditions).signInRiskLevels -join ','
            $clientAppTypes = (($tempAR[$num]).conditions).clientAppTypes -join ','
            $deviceStates = (($tempAR[$num]).conditions).deviceStates -join ','
            $devices = (($tempAR[$num]).conditions).devices -join ','
            $clientApplications = (($tempAR[$num]).conditions).clientApplications -join ','
            $ApplicationIncludeApplications = ((($tempAR[$num]).conditions).Applications).IncludeApplications -join ','
            $ApplicationExcludeApplications = ((($tempAR[$num]).conditions).Applications).ExcludeApplications -join ','
            $ApplicationIncludeUserActions = ((($tempAR[$num]).conditions).Applications).IncludeUserActions -join ','
            $ApplicationIncludeAuthenticationContextClassReferences = ((($tempAR[$num]).conditions).Applications).includeAuthenticationContextClassReferences -join ','
            $UserIncludeUsers = ((($tempAR[$num]).conditions).Users).IncludeUsers -join ','
            if (((($tempAR[$num]).conditions).Users).IncludeUsers -ne '') {
                if ($Script:ExportControl -ne 'Yes') {
                    if (((($tempAR[$num]).conditions).Users).IncludeUsers -ne 'All') {
                        $UserIncludeUsersName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeUsers
                        $UserIncludeUsersName = ($UserIncludeUsersName).UserPrincipalName -join ","
                    }
                }
            }
            $UserExcludeUsers = ((($tempAR[$num]).conditions).Users).ExcludeUsers -join ','
            if (((($tempAR[$num]).conditions).Users).ExcludeUsers -ne '') {
                if ($Script:ExportControl -ne 'Yes') {
                    if (((($tempAR[$num]).conditions).Users).ExcludeUsers -ne 'All') {
                        $UserExcludeUsersName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeUsers
                        $UserExcludeUsersName = ($UserExcludeUsersName).UserPrincipalName -join ","
                    }
                }
            }
            $UserIncludeGroups = ((($tempAR[$num]).conditions).Users).IncludeGroups -join ','
            if (((($tempAR[$num]).conditions).Users).IncludeGroups -ne '') {
                if ($Script:ExportControl -ne 'Yes') {
                    if (((($tempAR[$num]).conditions).Users).IncludeGroups -ne 'All') {
                        $UserIncludeGroupsName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeGroups
                        $UserIncludeGroupsName = ($UserIncludeGroupsName).DisplayName -join ","
                    }
                }
            }
            $UserExcludeGroups = ((($tempAR[$num]).conditions).Users).ExcludeGroups -join ','
            if (((($tempAR[$num]).conditions).Users).ExcludeGroups -ne '') {
                if ($Script:ExportControl -ne 'Yes') {
                    if (((($tempAR[$num]).conditions).Users).ExcludeGroups -ne 'All') {
                        $UserExcludeGroupsName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeGroups
                        $UserExcludeGroupsName = ($UserExcludeGroupsName).DisplayName -join ","
                    }
                }
            }
            $UserIncludeRoles = ((($tempAR[$num]).conditions).Users).IncludeRoles -join ','
            if (((($tempAR[$num]).conditions).Users).IncludeRoles -ne '') {
                if (((($tempAR[$num]).conditions).Users).IncludeRoles -ne 'All') {
                    $UserIncludeRolesName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeRoles
                    $UserIncludeRolesName = ($UserIncludeRolesName).DisplayName -join ","
                }
            }
            $UserExcludeRoles = ((($tempAR[$num]).conditions).Users).ExcludeRoles -join ','
            if (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne '') {
                if (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne 'All') {
                    $UserExcludeRolesName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeRoles
                    $UserExcludeRolesName = ($UserExcludeRolesName).DisplayName -join ","
                }
            }
            $PlatformIncludePlatforms = ((($tempAR[$num]).conditions).Platforms).IncludePlatforms -join ','
            $PlatformExcludePlatforms = ((($tempAR[$num]).conditions).Platforms).ExcludePlatforms -join ','
            $LocationIncludeLocations = ((($tempAR[$num]).conditions).Locations).IncludeLocations -join ','
            $LocationExcludeLocations = ((($tempAR[$num]).conditions).Locations).ExcludeLocations -join ','
            $DeviceStateIncludeStates = ((($tempAR[$num]).conditions).DeviceState).IncludeStates -join ','
            $DeviceStateExcludeStates = ((($tempAR[$num]).conditions).DeviceState).ExcludeStates -join ','
            $GrantControlOperator = (($tempAR[$num]).GrantControls).Operator -join ','
            $GrantControlBuiltInControls = (($tempAR[$num]).GrantControls).BuiltInControls -join ','
            $GrantControlCustomAuthenticationFactors = (($tempAR[$num]).GrantControls).CustomAuthenticationFactors -join ','
            $GrantControlTermsOfUse = (($tempAR[$num]).GrantControls).TermsOfUse -join ','
            $ApplicationEnforcedRestrictions = ((($tempAR[$num]).SessionControls).ApplicationEnforcedRestrictions).IsEnabled -join ','
            $CloudAppSecurityIsEnabled = ((($tempAR[$num]).SessionControls).CloudAppSecurity).IsEnabled -join ','
            $CloudAppSecurityCloudAppSecurityType = ((($tempAR[$num]).SessionControls).CloudAppSecurity).CloudAppSecurityType -join ','
            $PersistentBrowserIsEnabled = ((($tempAR[$num]).SessionControls).PersistentBrowser).IsEnabled -join ','
            $PersistentBrowserMode = ((($tempAR[$num]).SessionControls).PersistentBrowser).Mode -join ','
            $SignInFrequencyIsEnabled = ((($tempAR[$num]).SessionControls).SignInFrequency).IsEnabled -join ','
            $SignInFrequencyType = ((($tempAR[$num]).SessionControls).SignInFrequency).Type -join ','
            $SignInFrequencyValue = ((($tempAR[$num]).SessionControls).SignInFrequency).Value -join ','

            $CAPoliciesT = New-Object PSobject -Property @{
                "Displayname"                                            = $Displayname
                "State"                                                  = $State
                "ID"                                                     = $ID
                "createdDateTime"                                        = $createdDateTime
                "ModifiedDateTime"                                       = $ModifiedDateTime
                "sessionControls"                                        = $sessionControls
                "userRiskLevels"                                         = $userRiskLevels
                "signInRiskLevels"                                       = $signInRiskLevels
                "clientAppTypes"                                         = $clientAppTypes
                "deviceStates"                                           = $deviceStates
                "devices"                                                = $devices
                "clientApplications"                                     = $clientApplications
                "ApplicationIncludeApplications"                         = $ApplicationIncludeApplications
                "ApplicationExcludeApplications"                         = $ApplicationExcludeApplications
                "ApplicationIncludeUserActions"                          = $ApplicationIncludeUserActions
                "ApplicationIncludeAuthenticationContextClassReferences" = $ApplicationIncludeAuthenticationContextClassReferences
                "UserIncludeUsers"                                       = $UserIncludeUsers
                "UserExcludeUsers"                                       = $UserExcludeUsers
                "UserIncludeGroups"                                      = $UserIncludeGroups
                "UserExcludeGroups"                                      = $UserExcludeGroups
                "UserIncludeRoles"                                       = $UserIncludeRoles
                "UserIncludeRolesName"                                   = $UserIncludeRolesName
                "UserExcludeRoles"                                       = $UserExcludeRoles
                "UserExcludeRolesName"                                   = $UserExcludeRolesName
                "PlatformIncludePlatforms"                               = $PlatformIncludePlatforms
                "PlatformExcludePlatforms"                               = $PlatformExcludePlatforms
                "LocationIncludeLocations"                               = $LocationIncludeLocations
                "LocationExcludeLocations"                               = $LocationExcludeLocations
                "DeviceStateIncludeStates"                               = $DeviceStateIncludeStates
                "DeviceStateExcludeStates"                               = $DeviceStateExcludeStates
                "GrantControlOperator"                                   = $GrantControlOperator
                "GrantControlBuiltInControls"                            = $GrantControlBuiltInControls
                "GrantControlCustomAuthenticationFactors"                = $GrantControlCustomAuthenticationFactors
                "GrantControlTermsOfUse"                                 = $GrantControlTermsOfUse
                "ApplicationEnforcedRestrictions"                        = $ApplicationEnforcedRestrictions
                "CloudAppSecurityIsEnabled"                              = $CloudAppSecurityIsEnabled
                "CloudAppSecurityCloudAppSecurityType"                   = $CloudAppSecurityCloudAppSecurityType
                "PersistentBrowserIsEnabled"                             = $PersistentBrowserIsEnabled
                "PersistentBrowserMode"                                  = $PersistentBrowserMode
                "SignInFrequencyIsEnabled"                               = $SignInFrequencyIsEnabled
                "SignInFrequencyType"                                    = $SignInFrequencyType
                "SignInFrequencyValue"                                   = $SignInFrequencyValue
            }
            [void]$Script:CAPolicies.Add($CAPoliciesT)
        }
    }
}

# XML File
$tempAR = @(Import-Clixml -Path "C:\Users\MikePatterson\OneDrive - CloudFit Software\M365Compliance\CAPolicies.xml")

# Export File
$exportFile = "C:\Temp\$(Get-Date -Format yyyy-MM-dd-HH-mm) - CA Policies.csv"

# Get CA Policies
Get-CAPolicies

# Export Data
$Script:CAPolicies | export-csv -Path $exportFile -NoTypeInformation