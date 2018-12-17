variable "prefix" { }
variable "location" { }
variable "keyvault-object-id" { }
variable "computerName" { }
variable "username" { }
variable "password" { }

variable "timezone" {
  default = "Mountain Standard Time"
}

variable "vm" {
  type = "map"
  default = {
    publisher = "MicrosoftVisualStudio"
    offer     = "Windows"
    sku       = "Windows-10-N-x64"
    version   = "latest"
  }
}