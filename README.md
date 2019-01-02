## Create a secret.tfvars File

```bash
keyvault-object-id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

username = "myusername"

prefix = "your-resourcegroup-name"
computerName = "MACHINENAME"
location = "westus2"
```

## Run with Terraform

```bash
terraform apply -var-file="secret.tfvars" -var 'password=yourpassword'
```

## Setup Windows 10

* Run Windows Update
* Add computer to Azure Active Directory
* Login with AAD account
* Install Windows Subsystem for Linux (WSL) 
  * wlinux
* Install Visual Studio Code
* Setup OneDrive
* Install Visual Studio Enterprise
* Install Docker (Edge) for Windows
* $ bash /etc/setup
  * Install Python
  * Install NodeJs
  * Install DotNet
  * Install Docker Bridge
* sudo ln -s /usr/bin/python3 /usr/bin/python
* sudo ln -s /usr/bin/pip3 /usr/bin/pip
* curl -L https://aka.ms/InstallAzureCli | bash