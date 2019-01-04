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

## Encrypt Drives
```bash
az vm encryption enable --resource-group "cdw-azvm-20190103" --name "AZVM20190103" --disk-encryption-keyvault "cdw-azvm-20190103-vault" --volume-type ALL

az vm encryption show --resource-group "cdw-azvm-20190103" --name "AZVM20190103"
```

## Azure Active Directory

* Add computer to Azure Active Directory
* Login with AAD account

## Setup Windows 10

* Run Windows Update
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