function Create-OU {

    param (
        [string]$name
    )

    $OUPath = "DC=Globex,DC=com"

    if (Get-ADOrganizationalUnit -Filter "Name -eq '$name'" -SeachBase $OUPath){
    
        Write-Host "Organizational Unit '$name' already exists" -ForegroundColor Yellow
        return

    }

    Try{
        
        New-ADOrganizationalUnit -Name $name -Path "DC=Globex,DC=com" -ProtectedFromAccidentalDeletion $false 
        Write-Host "Organizational Unit '$name' was successfully created." -ForegroundColor Green
    
    } Catch {
    
        Write-Host ("Failed to Create") -ForegroundColor Red 
    
    }

}
