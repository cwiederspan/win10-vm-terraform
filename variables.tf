variable "prefix" { 
  default = "cdw-azvm-20181215"
}

variable "location" {
  default = "westus2"
}

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