resource "azurerm_resource_group" "myGroup" {
  name     = "${var.prefix}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "myVnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.myGroup.location}"
  resource_group_name = "${azurerm_resource_group.myGroup.name}"
}

resource "azurerm_subnet" "mySubnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = "${azurerm_resource_group.myGroup.name}"
  virtual_network_name = "${azurerm_virtual_network.myVnet.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_public_ip" "myIp" {
  name                         = "${var.prefix}-ip"
  resource_group_name          = "${azurerm_resource_group.myGroup.name}"
  location                     = "${azurerm_resource_group.myGroup.location}"
  public_ip_address_allocation = "dynamic"
  domain_name_label            = "${lower(var.computerName)}"
}

resource "azurerm_network_security_group" "myNsg" {
  name                = "${var.prefix}-nsg"
  resource_group_name = "${azurerm_resource_group.myGroup.name}"
  location            = "${azurerm_resource_group.myGroup.location}"

  security_rule {
    name                      = "RDP"
    priority                  = 300
    direction                 = "Inbound"
    access                    = "Allow"
    protocol                  = "Tcp"
    source_address_prefix       = "*"
    source_port_range           = "*"
    destination_address_prefix  = "*"
    destination_port_range      = "3389"
  }
}

resource "azurerm_network_interface" "myNic" {
  name                      = "${var.prefix}-nic"
  location                  = "${azurerm_resource_group.myGroup.location}"
  resource_group_name       = "${azurerm_resource_group.myGroup.name}"
  network_security_group_id = "${azurerm_network_security_group.myNsg.id}"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = "${azurerm_subnet.mySubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.myIp.id}"
  }
}