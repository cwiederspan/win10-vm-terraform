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
