module "rg" {
    source = "../c-module/RG"
    resource_group_name   = "jginfra"
    location = "australiaeast"
  
}

module "vnet" {
    source = "../c-module/VNET"
    depends_on = [ module.rg ]
    
    virtual_network_name = "jgvnet"
    resource_group_name  = "jginfra"
    location             = "australiaeast"
    address_space        = ["10.0.0.0/16"]
}
module "subnet" {
    source = "../c-module/SUBNET"
    depends_on = [ module.vnet ]
    for_each    = {
        Frontend = {
        name = "jgfrontend"
        resource_group_name = "jginfra"
        virtual_network_name = "jgvnet"
        address_prefixes = ["10.0.0.0/26"]
    }
   
    Backend = {
        name = "jgbackend"
        resource_group_name = "jginfra"
        virtual_network_name = "jgvnet"
        address_prefixes = ["10.0.0.64/26"]
    }

    firewall = {
        name = "AzureFirewallSubnet"
        resource_group_name = "jginfra"
        virtual_network_name = "jgvnet"
        address_prefixes = ["10.0.0.128/26"]

}

appgateway = {
        name = "AzureApplicationGateway"
        resource_group_name = "jginfra"
        virtual_network_name = "jgvnet"
        address_prefixes = ["10.0.1.0/26"]
    }
    azurebastion = {
        name = "AzureBastionSubnet"
      resource_group_name = "jginfra"
        virtual_network_name = "jgvnet"
        address_prefixes = ["10.0.0.224/27"]
    }
    }

    subnet_name          = each.value.name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
    address_prefixes     = each.value.address_prefixes
}

module "frontvm" {
    source = "../c-module/VM"
    location = data.azurerm_resource_group.jvm_resource_group.location
    resource_group_name = data.azurerm_resource_group.jvm_resource_group.name
    vm_name = local.vm_matrix.frontend.vm_name
    vm_size = local.vm_matrix.frontend.vm_size
    admin_username = local.vm_matrix.frontend.admin_username
    admin_password = local.vm_matrix.frontend.admin_password
    vmpublisher = local.vm_matrix.frontend.vmpublisher
    vmoffer = local.vm_matrix.frontend.vmoffer
    vmsku = local.vm_matrix.frontend.vmsku
    vmversion = local.vm_matrix.frontend.vmversion
    assign_public_ip = local.vm_matrix.frontend.assign_public_ip
    nic_name = local.vm_matrix.frontend.nic_name
    public_ip_name = local.vm_matrix.frontend.public_ip_name
    subnet_id = data.azurerm_subnet.jvm_subnet.id


}

module "backvm" {
    source = "../c-module/VM"
    location = data.azurerm_resource_group.jvm_resource_group.location
    resource_group_name = data.azurerm_resource_group.jvm_resource_group.name
    vm_name = local.vm_matrix.backend.vm_name
    vm_size = local.vm_matrix.backend.vm_size
    admin_username = local.vm_matrix.backend.admin_username
    admin_password = local.vm_matrix.backend.admin_password
    vmpublisher = local.vm_matrix.backend.vmpublisher
    vmoffer = local.vm_matrix.backend.vmoffer
    vmsku = local.vm_matrix.backend.vmsku
    vmversion = local.vm_matrix.backend.vmversion
    assign_public_ip = local.vm_matrix.backend.assign_public_ip
    nic_name = local.vm_matrix.backend.nic_name
    public_ip_name = local.vm_matrix.backend.public_ip_name
    subnet_id = data.azurerm_subnet.jvm_subnetbk.id
}
