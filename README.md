 # Clean-Arch-Gen

 Welcome to **Clean-Arch-Gen**, a PowerShell script designed to automate the creation of a clean architecture folder structure for Flutter projects. This tool provides an easy and efficient way to set up your project directories, enhancing your development workflow.

 ## Features

 - Automatically generates a clean architecture folder structure for new Flutter features.
 - Optionally adds `.gitkeep` files to each directory to keep them in version control.
 - Customizable alias for easy script execution.
 - User-friendly prompts for inputting the alias name and features path.

 ## Prerequisites

 - Windows PowerShell
 - Basic understanding of PowerShell scripting and Flutter project structure

 ## Installation

 1. **Clone the Repository**

    ```sh
    git clone https://github.com/yourusername/Clean-Arch-Gen.git
    cd Clean-Arch-Gen
    ```

 2. **Run the Script**

    Choose one of the following methods to run the script:

    - **Method 1: Direct way through one-line script**

      Run the following one-line script directly in your PowerShell (Administrator mode) to set up your alias and customize the features path:

      ```powershell
      $AliasName = Read-Host "Please enter the alias name"; if ([string]::IsNullOrWhiteSpace($AliasName)) { Write-Host "Alias name cannot be empty. Please run the script again and provide a valid alias name."; exit }; Write-Host "Please enter the path to the features folder. For example, if your features are inside the 'lib' folder, enter 'lib/features'. The default path is 'lib/src'."; $DefaultFeaturesPath = "lib/src"; $FeaturesPath = Read-Host "Features Path (default: $DefaultFeaturesPath)"; if ([string]::IsNullOrWhiteSpace($FeaturesPath)) { $FeaturesPath = $DefaultFeaturesPath }; $ProfilePath = $PROFILE; if (-not (Test-Path $ProfilePath)) { New-Item -ItemType File -Path $ProfilePath -Force }; $AliasScript = "function $($AliasName+'Function') { `$FeatureName = Read-Host 'Please enter the feature name'; if ([string]::IsNullOrWhiteSpace(`$FeatureName)) { Write-Host 'Feature name cannot be empty. Please provide a valid feature name.'; return }; `$addGitkeep = Read-Host 'Do you want to add .gitkeep files to all folders? (yes/no)'; `$basePath = Join-Path -Path (Get-Location) -ChildPath `$FeaturesPath/`$FeatureName; `$directories = @('data/data_sources','data/models','data/repos','domain/entities','domain/repos','domain/use_cases','presentation/manager','presentation/views'); foreach (`$dir in `$directories) { `$path = Join-Path -Path `$basePath -ChildPath `$dir; if (-not (Test-Path -Path `$path)) { New-Item -ItemType Directory -Path `$path -Force; Write-Host ""Created directory: `$path"" } else { Write-Host ""Directory already exists: `$path"" }; if (`$addGitkeep -eq 'yes') { `$gitkeepPath = Join-Path -Path `$path -ChildPath '.gitkeep'; if (-not (Test-Path -Path `$gitkeepPath)) { New-Item -ItemType File -Path `$gitkeepPath -Force; Write-Host ""Added .gitkeep to: `$path"" } else { Write-Host "".gitkeep already exists in: `$path"" } } } Write-Host ""Folder structure for feature '`$FeatureName' has been created successfully."" }; Set-Alias $AliasName $($AliasName+'Function')"; Add-Content -Path $ProfilePath -Value $AliasScript; . $ProfilePath; Write-Host "----------------------------------------------"; Write-Host "Alias '$AliasName' has been created and added to your PowerShell profile." -ForegroundColor Green; Write-Host "You can now use the alias '$AliasName' to create new feature folder structures." -ForegroundColor Green; Write-Host "----------------------------------------------"
      ```

    - **Method 2: Run using PowerShell ISE**

      1- Open PowerShell ISE by searching for it in the Start menu or pressing Win + R and typing powershell_ise.

      2- Copy the following script and paste it into the PowerShell ISE window:
   
      ```powershell
      .\script.ps1
      ```

 ## Usage

 1. **Set Alias Name**

    When prompted, enter the alias name you wish to use for running the script. For example:

    ```
    Please enter the alias name: createFeature
    ```

 2. **Specify Features Path**

    Enter the path where your feature folders will be created. If you press Enter without typing a path, it will default to `lib/src`:

    ```
    Please enter the path to the features folder. For example, if your features are inside the 'lib' folder, enter 'lib/features'. The default path is 'lib/src'.
    Features Path (default: lib/src): lib/features
    ```

 3. **Create a New Feature**

    Use your alias to create a new feature folder structure. Run the alias in PowerShell:

    ```powershell
    createFeature
    ```

    You will be prompted to enter the feature name and whether you want to add `.gitkeep` files to all folders:

    ```
    Please enter the feature name: auth
    Do you want to add .gitkeep files to all folders? (yes/no): yes
    ```

 4. **Folder Structure**

    The script will generate the following folder structure under the specified features path:

    ```
    lib/features/auth/
    ├── data
    │   ├── data_sources
    │   ├── models
    │   └── repos
    ├── domain
    │   ├── entities
    │   ├── repos
    │   └── use_cases
    └── presentation
        ├── manager
        └── views
    ```

    If `.gitkeep` files are requested, they will be added to each directory to ensure they are tracked by git.

 ## Contributing

 Contributions are welcome! If you have suggestions or find issues, please create an issue or submit a pull request.

 ## License

 This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

 ## Contact

 For any questions or feedback, feel free to contact [Abdalrahman Alhamod](mailto:abd.alrrahman.alhamod@gmail.com).

 ---

 Thank you for using **Clean-Arch-Gen**! Happy coding!
