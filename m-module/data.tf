data "azurerm_resource_group" "jvm_resource_group" {
  name = "jginfra"
}

data "azurerm_virtual_network" "jvm_vnet" {
  name                = "jgvnet"
  resource_group_name = data.azurerm_resource_group.jvm_resource_group.name
}
data "azurerm_subnet" "jvm_subnet" {
  name                 = "jgfrontend"
  resource_group_name  = data.azurerm_resource_group.jvm_resource_group.name
  virtual_network_name = data.azurerm_virtual_network.jvm_vnet.name
}
data "azurerm_subnet" "jvm_subnetbk" {
    name                 = "jgbackend"
    resource_group_name  = data.azurerm_resource_group.jvm_resource_group.name
    virtual_network_name = data.azurerm_virtual_network.jvm_vnet.name
  
}

data "azurerm_subnet" "fw" {
    resource_group_name  = data.azurerm_resource_group.jvm_resource_group.name
    virtual_network_name = data.azurerm_virtual_network.jvm_vnet.name
    name                 = "AzureFirewallSubnet"


}

data "azurerm_subnet" "appgw" {
    resource_group_name  = data.azurerm_resource_group.jvm_resource_group.name
    virtual_network_name = data.azurerm_virtual_network.jvm_vnet.name
    name                 = "AzureApplicationGateway"
  
}

data "azurerm_subnet" "bastion" {
    resource_group_name  = data.azurerm_resource_group.jvm_resource_group.name
    virtual_network_name = data.azurerm_virtual_network.jvm_vnet.name
    name                 = "AzureBastionSubnet"
  
}
data "azurerm_key_vault" "jvm_keyvault" {
  name                = "keyvaultjagseer"
  resource_group_name = data.azurerm_resource_group.jvm_resource_group.name
}

data "azurerm_key_vault_secret" "jvm_secret" {
  name = "jvm-frontu"
  key_vault_id = data.azurerm_key_vault.jvm_keyvault.id
}
data "azurerm_key_vault_secret" "jvm_secretp" {
  name = "jvm-frontp"
  key_vault_id = data.azurerm_key_vault.jvm_keyvault.id
}
data "azurerm_key_vault_secret" "jvm_secretbk" {
  name = "jv-bakendu"
  key_vault_id = data.azurerm_key_vault.jvm_keyvault.id
}
data "azurerm_key_vault_secret" "jvm_secretbkp" {
  name = "jvm-backendp"
  key_vault_id = data.azurerm_key_vault.jvm_keyvault.id
}