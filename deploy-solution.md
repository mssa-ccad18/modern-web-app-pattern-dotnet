# Deploy the solution

This reference implementation provides you with the instructions and templates you need to deploy this solution. This solution uses the Azure Dev CLI to set up Azure services and deploy the code.

## Pre-requisites

1. To run the scripts, Windows users require [Powershell 7.2 (LTS)](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows) or above. Alternatively, you can use a bash terminal using [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). macOS users can use a bash terminal.

1. [Install the Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli).
    Run the following command to verify that you're running version
    2.38.0 or higher.

    ```ps1
    az version
    ```
    
    After the installation, run the following command to [sign in to Azure interactively](https://learn.microsoft.com/cli/azure/authenticate-azure-cli#sign-in-interactively).

    ```ps1
    az login
    ```
1. [Upgrade the Azure CLI Bicep extension](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-cli).
    Run the following command to verify that you're running version 0.12.40 or higher.

    ```ps1
    az bicep version
    ```

1. [Install the Azure Dev CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd).
    Run the following command to verify that the Azure Dev CLI is installed.

    ```ps1
    azd version
    ```

1. [Install .NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
    Run the following command to verify that the .NET SDK 6.0 is installed.
    ```ps1
    dotnet --version
    ```

1. [Create Azure AD B2C App Registrations](create-AADB2C-app-registrations.md)
    This app sample deploys a public facing web app secured by Azure AD B2C. There are no automation steps
    available for this step, please visit the doc to learn more about this pre-req step.

## Get the code

Please clone the repo to get started.

```
git clone https://github.com/Azure/modern-web-app-pattern-dotnet
```

And switch to the folder so that `azd` will recognize the solution.

```
cd modern-web-app-pattern-dotnet
```