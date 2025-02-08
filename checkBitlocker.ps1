# Get all mounted volumes
$volumes = Get-Volume | Where-Object { $_.DriveLetter -ne $null }

# Loop through each volume and check BitLocker status
foreach ($volume in $volumes) {
    $driveLetter = $volume.DriveLetter + ":"
    Write-Host "Checking BitLocker status for volume: $driveLetter"
    
    # Execute manage-bde command to check BitLocker status
    manage-bde -status $driveLetter
}