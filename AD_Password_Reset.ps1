function Reset_Password {

    param (
        [string]$UID,
        [string]$password
    )

    Try {

        $securePassword = ConvertTo-SecureString -AsPlainText $password -Force 
        
        Set-ADAccountPassword -Identity $UID -NewPassword $securePassword

        Get-ADUser -Identity $UID -ChangePasswordAtLogon $True

        Write-Host "Password for user '$UID' has been reset successfully."
    
    } Catch {

        Write-Host "An error has occurred: $($_.Exception.Message)"
    }
}

