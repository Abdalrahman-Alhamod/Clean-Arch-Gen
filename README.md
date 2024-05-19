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

    Execute the PowerShell script to set up your alias and customize the features path:

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
