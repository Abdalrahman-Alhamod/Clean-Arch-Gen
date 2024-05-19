# Prompt the user for the alias name
$AliasName = Read-Host "Please enter the alias name"

if ([string]::IsNullOrWhiteSpace($AliasName)) {
    Write-Host "Alias name cannot be empty. Please run the script again and provide a valid alias name."
    exit
}

# Provide explanation for entering features path
$Explanation = "Please enter the path to the features folder. For example, if your features are inside the 'lib' folder, enter 'lib/features'. The default path is 'lib/src'."
Write-Host $Explanation

# Prompt the user to input the features path with a default value
$DefaultFeaturesPath = "lib/src"
$FeaturesPath = Read-Host "Features Path (default: $DefaultFeaturesPath)"
if ([string]::IsNullOrWhiteSpace($FeaturesPath)) {
    $FeaturesPath = $DefaultFeaturesPath
}

# Define the alias script with the user-inputted alias name and features path
$AliasScript = @"
`nfunction $($AliasName+'Function') {
    `$FeatureName = Read-Host 'Please enter the feature name'
    if ([string]::IsNullOrWhiteSpace(`$FeatureName)) {
        Write-Host 'Feature name cannot be empty. Please provide a valid feature name.'
        return
    }
    `$addGitkeep = Read-Host 'Do you want to add .gitkeep files to all folders? (yes/no)'
    `$basePath = Join-Path -Path (Get-Location) -ChildPath `$FeaturesPath/`$FeatureName
    `$directories = @(
        'data/data_sources',
        'data/models',
        'data/repos',
        'domain/entities',
        'domain/repos',
        'domain/use_cases',
        'presentation/manager',
        'presentation/views'
    )
    foreach (`$dir in `$directories) {
        `$path = Join-Path -Path `$basePath -ChildPath `$dir
        if (-not (Test-Path -Path `$path)) {
            New-Item -ItemType Directory -Path `$path -Force
            Write-Host "Created directory: `$path"
        } else {
            Write-Host "Directory already exists: `$path"
        }
        if (`$addGitkeep -eq 'yes') {
            `$gitkeepPath = Join-Path -Path `$path -ChildPath '.gitkeep'
            if (-not (Test-Path -Path `$gitkeepPath)) {
                New-Item -ItemType File -Path `$gitkeepPath -Force
                Write-Host "Added .gitkeep to: `$path"
            } else {
                Write-Host ".gitkeep already exists in: `$path"
            }
        }
    }
    Write-Host "Folder structure for feature '`$FeatureName' has been created successfully."
}
Set-Alias $AliasName $($AliasName+'Function')
"@

# Get the path to the PowerShell profile
$ProfilePath = $PROFILE

# Check if the profile exists, if not, create it
if (-not (Test-Path $ProfilePath)) {
    New-Item -ItemType File -Path $ProfilePath -Force
}

# Append the alias script to the PowerShell profile
Add-Content -Path $ProfilePath -Value $AliasScript

# Reload the PowerShell profile to apply changes
. $ProfilePath

Write-Host "----------------------------------------------"
Write-Host "Alias '$AliasName' has been created and added to your PowerShell profile." -ForegroundColor Green
Write-Host "You can now use the alias '$AliasName' to create new feature folder structures." -ForegroundColor Green
Write-Host "----------------------------------------------"

