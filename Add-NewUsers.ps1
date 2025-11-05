Import-Csv "C:\polku\users_hierarkiaAD.csv" | ForEach-Object {
    New-ADUser `
        -Name $_.Name `
        -GivenName $_.GivenName `
        -Surname $_.Surname `
        -SamAccountName $_.SamAccountName `
        -UserPrincipalName $_.UserPrincipalName `
        -EmailAddress $_.Email `
        -Office $_.Office `
        -Department $_.Department `
        -Title $_.Title `
        -StreetAddress $_.StreetAddress `
        -OfficePhone $_.Phone `
        -Manager (Get-ADUser -Filter "Name -eq '$($_.Manager)'").DistinguishedName `
        -AccountPassword (ConvertTo-SecureString "Salasana123!" -AsPlainText -Force) `
        -Enabled $true `
        -Path "OU=YourOU,DC=domain,DC=local"
}
