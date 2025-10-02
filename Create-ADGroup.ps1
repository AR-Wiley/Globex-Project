
function Create-Group {

	param (
		[string]$name,
		[string]$OU,
		[ValidateSet("Global","Universal","DomainLocal")][string]$groupScope
	)

	$groupPath = "OU=$OU,DC=Globex,DC=Com"

	if (Get-ADGroup -Filter "Name -eq '$name'" -SearchBase $groupPath) {
		Write-Host "Group $name already exists" 
		return
	}

	Try {
		New-ADGroup -Name $name -Path $groupPath -GroupScope $groupScope -GroupCategory Security
		Write-Host "AD Group $name had been created"
	} Catch {
		Write-Host "Failed to create"
	}


}