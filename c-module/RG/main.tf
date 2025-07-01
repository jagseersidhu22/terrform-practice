# RG module for Azure infra - Aparna1505

resource "azurerm_resource_group" "rgj" {
  name     = var.resource_group_name
  location = var.location
  
}
