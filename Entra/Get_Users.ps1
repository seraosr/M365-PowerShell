
Connect-MgGraph -Scopes "User.Read.All","AuditLog.Read.All"

$users = Get-MgUser -All -Property `
"userPrincipalName,accountEnabled,userType,onPremisesSyncEnabled,createdDateTime,jobTitle,department,companyName,mail,officeLocation,state,employeeId,id,signInActivity"

$report = $users | Select-Object `
@{Name="User Principal Name";Expression={$_.UserPrincipalName}},
@{Name="Account Enabled";Expression={$_.AccountEnabled}},
@{Name="User Type";Expression={$_.UserType}},
@{Name="On-premises sync enabled";Expression={$_.OnPremisesSyncEnabled}},
@{Name="Last interactive sign-in time";Expression={$_.SignInActivity.LastSignInDateTime}},
@{Name="Created Date Time";Expression={$_.CreatedDateTime}},
@{Name="Job Title";Expression={$_.JobTitle}},
@{Name="Department";Expression={$_.Department}},
@{Name="Company Name";Expression={$_.CompanyName}},
@{Name="Email";Expression={$_.Mail}},
@{Name="Office Location";Expression={$_.OfficeLocation}},
@{Name="State or Province";Expression={$_.State}},
@{Name="Employee ID";Expression={$_.EmployeeId}},
@{Name="Object ID";Expression={$_.Id}}

$report | Export-Csv "C:\Temp\Entra_Users_FullExport.csv" -NoTypeInformation -Encoding UTF8
