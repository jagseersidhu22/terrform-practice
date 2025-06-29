# RG module for Azure infra - jitendra jain

resource "azurerm_resource_group" "rgj" {
  name     = var.resource_group_name
  location = var.location
  
}
