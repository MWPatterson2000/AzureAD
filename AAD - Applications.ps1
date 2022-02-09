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
    $Displayname = ($tempAR[$num]).displayName
    $ObjectId = ($tempAR[$num]).ObjectId
    $AppId = ($tempAR[$num]).AppId
    $DeletionTimestamp = ($tempAR[$num]).DeletionTimestamp
    #$AddIns = ($tempAR[$num]).AddIns -join ',' 
    $AddInsId = (($tempAR[$num]).AddIns).Id -join ',' 
    $AddInsType = (($tempAR[$num]).AddIns).Type -join ',' 
    $AddInsProperties = (($tempAR[$num]).AddIns).Properties -join ',' 
    $AllowGuestsSignIn = ($tempAR[$num]).AllowGuestsSignIn -join ','
    $AllowPassthroughUsers = ($tempAR[$num]).AllowPassthroughUsers -join ','
    $AppLogoUrl = ($tempAR[$num]).AppLogoUrl -join ','
    #$AppRoles = ($tempAR[$num]).AppRoles #-join ','
    $AppRolesDescription = (($tempAR[$num]).AppRoles).Description -join ','
    $AppRolesDisplayName = (($tempAR[$num]).AppRoles).DisplayName -join ','
    $AppRolesId = (($tempAR[$num]).AppRoles).Id -join ','
    $AppRolesIsEnabled = (($tempAR[$num]).AppRoles).IsEnabled -join ','
    $AppRolesValue = (($tempAR[$num]).AppRoles).Value -join ','
    $AvailableToOtherTenants = ($tempAR[$num]).AvailableToOtherTenants -join ','
    $ErrorUrl = ($tempAR[$num]).ErrorUrl -join ','
    $GroupMembershipClaims = ($tempAR[$num]).GroupMembershipClaims -join ','
    $Homepage = ($tempAR[$num]).Homepage -join ','
    $IdentifierUris = ($tempAR[$num]).IdentifierUris -join ','
    #$InformationalUrls = ($tempAR[$num]).InformationalUrls #-join ','
    $InformationalUrlsTermsOfService = (($tempAR[$num]).InformationalUrls).TermsOfService -join ','
    $InformationalUrlsMarketing = (($tempAR[$num]).InformationalUrls).Marketing -join ','
    $InformationalUrlsPrivacy = (($tempAR[$num]).InformationalUrls).Privacy -join ','
    $InformationalUrlsSupport = (($tempAR[$num]).InformationalUrls).Support -join ','
    $IsDeviceOnlyAuthSupported = ($tempAR[$num]).IsDeviceOnlyAuthSupported -join ','
    $IsDisabled = ($tempAR[$num]).IsDisabled -join ','
    #$KeyCredentials = ($tempAR[$num]).KeyCredentials #-join ','
    $KeyCredentialsEndDate = (($tempAR[$num]).KeyCredentials).EndDate -join ','
    $KeyCredentialsKeyId = (($tempAR[$num]).KeyCredentials).KeyId -join ','
    $KeyCredentialsStartDate = (($tempAR[$num]).KeyCredentials).StartDate -join ','
    $KeyCredentialsType = (($tempAR[$num]).KeyCredentials).Type -join ','
    $KeyCredentialsUsage = (($tempAR[$num]).KeyCredentials).Usage -join ','
    $KeyCredentialsValue = (($tempAR[$num]).KeyCredentials).Value -join ','
    $KnownClientApplications = ($tempAR[$num]).KnownClientApplications -join ',' #Need Additional Info
    $LogoutUrl = ($tempAR[$num]).LogoutUrl -join ','
    $Oauth2AllowImplicitFlow = ($tempAR[$num]).Oauth2AllowImplicitFlow -join ','
    $Oauth2AllowUrlPathMatching = ($tempAR[$num]).Oauth2AllowUrlPathMatching -join ','
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
    $OptionalClaims = ($tempAR[$num]).OptionalClaims -join ','
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
    $RequiredResourceAccessResourceAppId = (($tempAR[$num]).RequiredResourceAccess).ResourceAppId -join ','
    $RequiredResourceAccessResourceAccess = (($tempAR[$num]).RequiredResourceAccess).ResourceAccess -join ','
    $SamlMetadataUrl = ($tempAR[$num]).SamlMetadataUrl -join ','
    $SignInAudience = ($tempAR[$num]).SignInAudience -join ','
    $WwwHomepage = ($tempAR[$num]).WwwHomepage -join ','
    #$ = ($tempAR[$num]). #-join ','
    <#
    $UserExcludeRoles = ((($tempAR[$num]).conditions).Users).ExcludeRoles -join ','
    If (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne '') {
        If (((($tempAR[$num]).conditions).Users).ExcludeRoles -ne 'All') {
            $UserExcludeRolesName = Get-AzureADObjectByObjectId -ObjectIds ((($tempAR[$num]).conditions).Users).ExcludeRoles
            $UserExcludeRolesName = ($UserExcludeRolesName).DisplayName -join ","
        }
    }        
    #>

    #$Script:AADApplications += New-Object PSobject -Property @{
    $AADApplicationsT = New-Object PSobject -Property @{
        "Displayname" = $Displayname
        "ObjectId" = $ObjectId
        "AppId" = $AppId
        "DeletionTimestamp" = $DeletionTimestamp
        #"AddIns" = $AddIns
        "AddIns Id" = $AddInsId
        "AddIns Type" = $AddInsType
        "AddIns Properties" = $AddInsProperties
        "AllowGuestsSignIn" = $AllowGuestsSignIn
        "AllowPassthroughUsers" = $AllowPassthroughUsers
        "AppLogoUrl" = $AppLogoUrl
        #"AppRoles" = $AppRoles
        "AppRoles Description" = $AppRolesDescription
        "AppRoles DisplayName" = $AppRolesDisplayName
        "AppRoles Id" = $AppRolesId
        "AppRoles IsEnabled" = $AppRolesIsEnabled
        "AppRoles Value" = $AppRolesValue
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
