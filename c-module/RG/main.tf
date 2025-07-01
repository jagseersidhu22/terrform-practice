# RG module for Azure infra - 1901

resource "azurerm_resource_group" "rgj" {
  name     = var.resource_group_name
  location = var.location
  
}
