# resource "azurerm_managed_disk" "myOsDisk" {
#   name                 = "vm-os-disk"  
#   location             = "${azurerm_resource_group.myGroup.location}"  
#   resource_group_name  = "${azurerm_resource_group.myGroup.name}"  
#   storage_account_type = "Standard_LRS"  
#   create_option        = "Empty"  
#   disk_size_gb         = "1023"  
# }  

resource "azurerm_virtual_machine" "myVm" {
  name                  = "${var.computerName}"
  location              = "${var.location}"  
  resource_group_name   = "${azurerm_resource_group.myGroup.name}"  
  network_interface_ids = ["${azurerm_network_interface.myNic.id}"]  
  vm_size               = "Standard_D8s_v3"
  license_type          = "Windows_Client"  # Use Hybrid License

  delete_data_disks_on_termination = false  # Hard-coded for safety

  storage_image_reference {
    publisher = "${var.vm["publisher"]}"
    offer     = "${var.vm["offer"]}"
    sku       = "${var.vm["sku"]}"
    version   = "${var.vm["version"]}"
  }
  
  storage_os_disk {
    name              = "${var.prefix}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = "128"   # Can also be 256
  }  
  
  # storage_data_disk {
  #   name            = "${azurerm_managed_disk.datadisk.name}"  
  #   managed_disk_id = "${azurerm_managed_disk.datadisk.id}"  
  #   create_option   = "Attach"  
  #   lun             = 1  
  #   disk_size_gb    = "${azurerm_managed_disk.datadisk.disk_size_gb}"  
  # }
  
  os_profile {
    computer_name  = "${var.computerName}"
    admin_username = "${var.username}"  
    admin_password = "${var.password}"  
  }
  
  os_profile_windows_config {
    enable_automatic_upgrades = true  
    provision_vm_agent        = true
    timezone                  = "${var.timezone}"
  }
}