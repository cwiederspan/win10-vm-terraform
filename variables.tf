variable "prefix" { 
  default = "cdw-azvm-20181215"
}

variable "location" {
  default = "westus2"
}

variable "keyvault-object-id" {
  default = "f446ab5a-fe3c-4db2-b7b6-912a84610b29"
}

variable "computerName" {
  default = "AZVM20181215"
}

variable "username" {
  default = "cwiederspan"
}

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