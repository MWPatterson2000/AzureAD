<#
    .SYNOPSIS
    Exports all Azure AD Applications
    
    .DESCRIPTION
    Exports all Azure ADApplications to a CSV file in c:\Temp
	Requires M365 account account with atleast Security Reader role
    	Dependant on Azure AD PowerShell module
    
    #>
    
# Export File
$exportFile = "C:\Temp\$(Get-Date -Format yyyy-MM-dd-HH-mm) - AAD - Applications.csv"

#Get Conditional Access Policies
$tempAR = @(Get-AzureADApplication)

# Build Array for output
#$Script:AADApplications = @()
$Script:AADApplications = [System.Collections.ArrayList]::new()

# Build Export Array
$count = @(($tempAR).Displayname).Count
$count = $count - 1
for ($num = 0 ; $num -le $count ; $num++) {
    $Displayname = ($tempAR[$num]).displayName #-join ','
    $ObjectId = ($tempAR[$num]).ObjectId
    $AppId = ($tempAR[$num]).AppId
    $DeletionTimestamp = ($tempAR[$num]).DeletionTimestamp #-join ','
    $AddIns = ($tempAR[$num]).AddIns -join ',' #Need Additional Info
    $AllowGuestsSignIn = ($tempAR[$num]).AllowGuestsSignIn #-join ','
    $AllowPassthroughUsers = ($tempAR[$num]).AllowPassthroughUsers #-join ','
    $AppLogoUrl = ($tempAR[$num]).AppLogoUrl #-join ','
    $AppRoles = ($tempAR[$num]).AppRoles #-join ','  #Need Additional Info
    $AvailableToOtherTenants = ($tempAR[$num]).AvailableToOtherTenants #-join ','
    $ErrorUrl = ($tempAR[$num]).ErrorUrl #-join ','
    $GroupMembershipClaims = ($tempAR[$num]).GroupMembershipClaims #-join ','
    $Homepage = ($tempAR[$num]).Homepage #-join ','
    $IdentifierUris = ($tempAR[$num]).IdentifierUris -join ','
    #$InformationalUrls = ($tempAR[$num]).InformationalUrls #-join ','
    $InformationalUrlsTermsOfService = (($tempAR[$num]).InformationalUrls).TermsOfService -join ','
    $InformationalUrlsMarketing = (($tempAR[$num]).InformationalUrls).Marketing -join ','
    $InformationalUrlsPrivacy = (($tempAR[$num]).InformationalUrls).Privacy -join ','
    $InformationalUrlsSupport = (($tempAR[$num]).InformationalUrls).Support -join ','
    $IsDeviceOnlyAuthSupported = ($tempAR[$num]).IsDeviceOnlyAuthSupported -join ','
    $IsDisabled = ($tempAR[$num]).IsDisabled #-join ','
    #$KeyCredentials = ($tempAR[$num]).KeyCredentials #-join ','
    $KeyCredentialsEndDate = (($tempAR[$num]).KeyCredentials).EndDate -join ','
    $KeyCredentialsKeyId = (($tempAR[$num]).KeyCredentials).KeyId -join ','
    $KeyCredentialsStartDate = (($tempAR[$num]).KeyCredentials).StartDate -join ','
    $KeyCredentialsType = (($tempAR[$num]).KeyCredentials).Type -join ','
    $KeyCredentialsUsage = (($tempAR[$num]).KeyCredentials).Usage -join ','
    $KeyCredentialsValue = (($tempAR[$num]).KeyCredentials).Value -join ','
    $KnownClientApplications = ($tempAR[$num]).KnownClientApplications -join ',' #Need Additional Info
    $LogoutUrl = ($tempAR[$num]).LogoutUrl #-join ','
    $Oauth2AllowImplicitFlow = ($tempAR[$num]).Oauth2AllowImplicitFlow #-join ','
    $Oauth2AllowUrlPathMatching = ($tempAR[$num]).Oauth2AllowUrlPathMatching #-join ','
    #$Oauth2Permissions = ($tempAR[$num]).Oauth2Permissions #-join ','
    $Oauth2PermissionsAdminConsentDescription = (($tempAR[$num]).Oauth2Permissions).AdminConsentDescription -join ','
    $Oauth2PermissionsAdminConsentDisplayName = (($tempAR[$num]).Oauth2Permissions).AdminConsentDisplayName -join ','
    $Oauth2PermissionsId = (($tempAR[$num]).Oauth2Permissions).Id -join ','
    $Oauth2PermissionsIsEnabled = (($tempAR[$num]).Oauth2Permissions).IsEnabled -join ','
    $Oauth2PermissionsType = (($tempAR[$num]).Oauth2Permissions).Type -join ','
    $Oauth2PermissionsUserConsentDescription = (($tempAR[$num]).Oauth2Permissions).UserConsentDescription -join ','
    $Oauth2PermissionsUserConsentDisplayName = (($tempAR[$num]).Oauth2Permissions).UserConsentDisplayName -join ','
    $Oauth2PermissionsValue = (($tempAR[$num]).Oauth2Permissions).Value -join ','
    $Oauth2RequirePostResponse = ($tempAR[$num]).Oauth2RequirePostResponse -join ','
    $OrgRestrictions = ($tempAR[$num]).OrgRestrictions #-join ',' #Need Additional Info
    $OptionalClaims = ($tempAR[$num]).OptionalClaims #-join ','
    #$ParentalControlSettings = ($tempAR[$num]).ParentalControlSettings #-join ','
    $ParentalControlSettingsCountriesBlockedForMinors = (($tempAR[$num]).ParentalControlSettings).CountriesBlockedForMinors -join ','
    $ParentalControlSettingsLegalAgeGroupRule = (($tempAR[$num]).ParentalControlSettings).LegalAgeGroupRule -join ','
    #$PasswordCredentials = ($tempAR[$num]).PasswordCredentials #-join ','
    $PasswordCredentialsCustomKeyIdentifier = (($tempAR[$num]).PasswordCredentials).CustomKeyIdentifier -join ','
    $PasswordCredentialsEndDate = (($tempAR[$num]).PasswordCredentials).EndDate -join ','
    $PasswordCredentialsKeyId = (($tempAR[$num]).PasswordCredentials).KeyId -join ','
    $PasswordCredentialsStartDate = (($tempAR[$num]).PasswordCredentials).StartDate -join ','
    $PasswordCredentialsValue = (($tempAR[$num]).PasswordCredentials).Value -join ','
    $PreAuthorizedApplications = ($tempAR[$num]).PreAuthorizedApplications -join ','
    $PublicClient = ($tempAR[$num]).PublicClient -join ','
    $PublisherDomain = ($tempAR[$num]).PublisherDomain -join ','
    $RecordConsentConditions = ($tempAR[$num]).RecordConsentConditions -join ','
    $ReplyUrls = ($tempAR[$num]).ReplyUrls -join ','
    #$RequiredResourceAccess = ($tempAR[$num]).RequiredResourceAccess #-join ','
    $RequiredResourceAccessResourceAppId = (($tempAR[$num]).RequiredResourceAccess).ResourceAppId #-join ','
    $RequiredResourceAccessResourceAccess = (($tempAR[$num]).RequiredResourceAccess).ResourceAccess #-join ','
    $SamlMetadataUrl = ($tempAR[$num]).SamlMetadataUrl #-join ','
    $SignInAudience = ($tempAR[$num]).SignInAudience #-join ','
    $WwwHomepage = ($tempAR[$num]).WwwHomepage #-join ','
    #$ = ($tempAR[$num]). #-join ','
    <#
    $State = ($tempAR[$num]).state -join ','
    $ID  = ($tempAR[$num]).id -join ','
    $createdDateTime = ($tempAR[$num]).createdDateTime -join ','
    $ModifiedDateTime  = ($tempAR[$num]).ModifiedDateTime -join ','
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
    If (((($tempAR[$num]).conditions).Users).IncludeUsers -ne '') {
        If (((($tempAR[$num]).conditions).Users).IncludeUsers -ne 'All') {
            $UserIncludeUsersName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeUsers
            $UserIncludeUsersName = ($UserIncludeUsersName).UserPrincipalName -join ","
        }
    }
    $UserExcludeUsers = ((($tempAR[$num]).conditions).Users).ExcludeUsers -join ','
    If (((($tempAR[$num]).conditions).Users).ExcludeUsers -ne '') {
        If (((($tempAR[$num]).conditions).Users).ExcludeUsers -ne 'All') {
            $UserExcludeUsersName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeUsers
            $UserExcludeUsersName = ($UserExcludeUsersName).UserPrincipalName -join ","
        }
    }
    $UserIncludeGroups = ((($tempAR[$num]).conditions).Users).IncludeGroups -join ','
    If (((($tempAR[$num]).conditions).Users).IncludeGroups -ne '') {
        If (((($tempAR[$num]).conditions).Users).IncludeGroups -ne 'All') {
            $UserIncludeGroupsName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeGroups
            $UserIncludeGroupsName = ($UserIncludeGroupsName).DisplayName -join ","
        }
    }
    $UserExcludeGroups = ((($tempAR[$num]).conditions).Users).ExcludeGroups -join ','
    If (((($tempAR[$num]).conditions).Users).ExcludeGroups -ne '') {
        If (((($tempAR[$num]).conditions).Users).ExcludeGroups -ne 'All') {
            $UserExcludeGroupsName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeGroups
            $UserExcludeGroupsName = ($UserExcludeGroupsName).DisplayName -join ","
        }
    }
    $UserIncludeRoles = ((($tempAR[$num]).conditions).Users).IncludeRoles -join ','
    If (((($tempAR[$num]).conditions).Users).IncludeRoles -ne '') {
        If (((($tempAR[$num]).conditions).Users).IncludeRoles -ne 'All') {
            $UserIncludeRolesName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).IncludeRoles
            $UserIncludeRolesName = ($UserIncludeRolesName).DisplayName-join ","
        }
    }
    $UserExcludeRoles = ((($tempAR[$num]).conditions).Users).ExcludeRoles -join ','
    If (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne '') {
        If (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne 'All') {
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
    #>

    #$Script:AADApplications += New-Object PSobject -Property @{
    $AADApplicationsT = New-Object PSobject -Property @{
        "Displayname" = $Displayname
        "ObjectId" = $ObjectId
        "AppId" = $AppId
        "DeletionTimestamp" = $DeletionTimestamp
        "AddIns" = $AddIns
        "AllowGuestsSignIn" = $AllowGuestsSignIn
        "AllowPassthroughUsers" = $AllowPassthroughUsers
        "AppLogoUrl" = $AppLogoUrl
        "AppRoles" = $AppRoles
        "AvailableToOtherTenants" = $AvailableToOtherTenants
        "ErrorUrl" = $ErrorUrl
        "GroupMembershipClaims" = $GroupMembershipClaims
        "Homepage" = $Homepage
        "IdentifierUris" = $IdentifierUris
        #"InformationalUrls" = $InformationalUrls
        "InformationalUrls TermsOfService" = $InformationalUrlsTermsOfService
        "InformationalUrls Marketing" = $InformationalUrlsMarketing
        "InformationalUrls Privacy" = $InformationalUrlsPrivacy
        "InformationalUrls Support" = $InformationalUrlsSupport
        "IsDeviceOnlyAuthSupported" = $IsDeviceOnlyAuthSupported
        "IsDisabled" = $IsDisabled
        #"KeyCredentials" = $KeyCredentials
        "KeyCredentials EndDate" = $KeyCredentialsEndDate
        "KeyCredentials KeyId" = $KeyCredentialsKeyId
        "KeyCredentials StartDate" = $KeyCredentialsStartDate
        "KeyCredentials Type" = $KeyCredentialsType
        "KeyCredentials Usage" = $KeyCredentialsUsage
        "KeyCredentials Value" = $KeyCredentialsValue
        "KnownClientApplications" = $KnownClientApplications
        "LogoutUrl" = $LogoutUrl
        "Oauth2AllowImplicitFlow" = $Oauth2AllowImplicitFlow
        "Oauth2AllowUrlPathMatching" = $Oauth2AllowUrlPathMatching
        #"Oauth2Permissions" = $Oauth2Permissions
        "Oauth2Permissions AdminConsentDescription" = $Oauth2PermissionsAdminConsentDescription
        "Oauth2Permissions AdminConsentDisplayName" = $Oauth2PermissionsAdminConsentDisplayName
        "Oauth2Permissions Id" = $Oauth2PermissionsId
        "Oauth2Permissions IsEnabled" = $Oauth2PermissionsIsEnabled
        "Oauth2Permissions Type" = $Oauth2PermissionsType
        "Oauth2Permissions UserConsentDescription" = $Oauth2PermissionsUserConsentDescription
        "Oauth2Permissions UserConsentDisplayName" = $Oauth2PermissionsUserConsentDisplayName
        "Oauth2Permissions Value" = $Oauth2PermissionsValue
        "Oauth2RequirePostResponse" = $Oauth2RequirePostResponse
        "OrgRestrictions" = $OrgRestrictions
        "OptionalClaims" = $OptionalClaims
        #"ParentalControlSettings" = $ParentalControlSettings
        "ParentalControlSettings CountriesBlockedForMinors" = $ParentalControlSettingsCountriesBlockedForMinors
        "ParentalControlSettings LegalAgeGroupRule" = $ParentalControlSettingsLegalAgeGroupRule
        #"PasswordCredentials" = $PasswordCredentials
        "PasswordCredentials CustomKeyIdentifier" = $PasswordCredentialsCustomKeyIdentifier
        "PasswordCredentials EndDate" = $PasswordCredentialsEndDate
        "PasswordCredentials KeyId" = $PasswordCredentialsKeyId
        "PasswordCredentials StartDate" = $PasswordCredentialsStartDate
        "PasswordCredentials Value" = $PasswordCredentialsValue
        "PreAuthorizedApplications" = $PreAuthorizedApplications
        "PublicClient" = $PublicClient
        "PublisherDomain" = $PublisherDomain
        "RecordConsentConditions" = $RecordConsentConditions
        "ReplyUrls" = $ReplyUrls
        #"RequiredResourceAccess" = $RequiredResourceAccess
        "RequiredResourceAccess ResourceAppId" = $RequiredResourceAccessResourceAppId
        "RequiredResourceAccess ResourceAccess" = $RequiredResourceAccessResourceAccess
        "SamlMetadataUrl" = $SamlMetadataUrl
        "SignInAudience" = $SignInAudience
        "WwwHomepage" = $WwwHomepage
    }
    [void]$Script:AADApplications.Add($AADApplicationsT)
}

# Export Data
$Script:AADApplications | export-csv -Path $exportFile -NoTypeInformation
