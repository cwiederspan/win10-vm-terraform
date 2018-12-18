# From https://github.com/Azure/terraform-azurerm-encryptedmanageddisk

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "myVault" {
  name                            = "${var.prefix}-vault"
  location                        = "${azurerm_resource_group.myGroup.location}"
  resource_group_name             = "${azurerm_resource_group.myGroup.name}"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tenant_id                       = "${data.azurerm_client_config.current.tenant_id}"

  sku {
    name = "standard"
  }

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${var.keyvault-object-id}"

    key_permissions = [
      "create",
      "delete",
      "get",
    ]

    secret_permissions = [
      "delete",
      "get",
      "set",
    ]
  }
}