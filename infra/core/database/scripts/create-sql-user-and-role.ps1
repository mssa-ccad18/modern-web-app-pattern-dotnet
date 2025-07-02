#Requires -Version 7.0

<#
.SYNOPSIS
    Creates a SQL user and assigns the user account to one or more roles.

.DESCRIPTION
    During an application deployment, the managed identity (and potentially the developer identity)
    must be added to the SQL database as a user and assigned to one or more roles. This script
    does exactly that using the owner managed identity, without relying on the Windows-only SqlServer module.

.PARAMETER SqlServerName
    The name of the SQL Server resource (logical server name, without “.database.windows.net”).

.PARAMETER SqlDatabaseName
    The name of the SQL Database resource.

.PARAMETER ObjectId
    The Object (Principal) ID of the user (managed identity) to be added.

.PARAMETER DisplayName
    The Object (Principal) display name of the user to be added.

.PARAMETER DatabaseRole
    The database role that needs to be assigned to the user (e.g. db_datareader).
#>

param(
    [string] $SqlServerName,
    [string] $SqlDatabaseName,
    [string] $ObjectId,
    [string] $DisplayName,
    [string] $DatabaseRole
)

### MAIN SCRIPT ###

# 1) Ensure Az.Resources is available for Get-AzAccessToken


# 2) Build idempotent T-SQL to create user + assign role
$sql = @"
DECLARE @username sysname = N'$($DisplayName)';
DECLARE @clientId UNIQUEIDENTIFIER = '$($ObjectId)';
DECLARE @sid VARBINARY(16) = CONVERT(VARBINARY(16), @clientId);
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = @username)
BEGIN
  EXEC(N'CREATE USER [' + @username + '] WITH SID = 0x' +
       SUBSTRING(sys.fn_varbintohexstr(@sid), 3, 32) + ', TYPE = E;');
END
IF NOT EXISTS (
  SELECT 1
    FROM sys.database_role_members drm
    JOIN sys.database_principals r ON r.principal_id = drm.role_principal_id
    JOIN sys.database_principals u ON u.principal_id = drm.member_principal_id
   WHERE r.name = '$($DatabaseRole)' AND u.name = @username
)
BEGIN
  EXEC sp_addrolemember N'$($DatabaseRole)', @username;
END
"@

Write-Output "`nSQL SCRIPT:`n$($sql)`n"

Write-Host "User '$DisplayName' ensured and '$DatabaseRole' assigned on '$SqlDatabaseName'."
