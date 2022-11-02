$shares = get-smbshare | where-object {$_.Path -like "*F:\*" -and $_.Path -ne "F:\"} | select-object Path
foreach ($share in $shares)
{
	(get-acl -name $share.path).access | where-object {$_.IdentityReference -like "*fishing*"} | select-object IdentityReference,objectclass
}