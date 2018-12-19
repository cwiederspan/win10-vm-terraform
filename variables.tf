variable "prefix" { }
variable "location" { }
variable "keyvault-object-id" { }
variable "computerName" { }
variable "username" { }
variable "password" { }

variable "timezone" {
  default = "Mountain Standard Time"
}

# To Lookup VM Images: az vm image list --output tsv --all > images.csv
# variable "vm" {
#   type = "map"
#   default = {
#     publisher = "MicrosoftVisualStudio"
#     offer     = "Windows"
#     sku       = "Windows-10-N-x64"
#     version   = "latest"
#   }
# }

variable "vm" {
  type = "map"
  default = {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "rs5-pro"
    version   = "latest"
  }
}

# This is an older version of Windows 10 and also doesn't load up the Microsoft Store app
# variable "vm" {
#   type = "map"
#   default = {
#     publisher = "MicrosoftVisualStudio"
#     offer     = "VisualStudio"
#     sku       = "VS-2017-Ent-Win10-N"
#     version   = "latest"
#   }
# }

# This image won't load up the Microsoft Store app
# variable "vm" {
#   type = "map"
#   default = {
#     publisher = "MicrosoftVisualStudio"
#     offer     = "VisualStudio"
#     sku       = "VS-2017-Ent-Latest-Win10-N"
#     version   = "latest"
#   }
# }