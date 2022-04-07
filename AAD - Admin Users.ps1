$AllRoleAssignments = ForEach ($Role in (Get-AzureADMSRoleDefinition)) {
    $RoleAssignment = Get-AzureADMSRoleAssignment -Filter "roleDefinitionId eq '$($Role.Id)'"
    if($RoleAssignment) {
        $User = Get-AzureADObjectByObjectId -ObjectIds $RoleAssignment.PrincipalId
        if($User.ObjectType -eq "User") {
            $User | Select-Object DisplayName,UserPrincipalName,ObjectType
        }
    }
}
$AllRoleAssignments | Sort-Object -Unique "UserPrincipalName" | Export-csv -Encoding utf8 -NoTypeInformation -Path C:\temp\AAD_Admins.csv   