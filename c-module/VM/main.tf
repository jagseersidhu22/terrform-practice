    # This module creates a VM in Azure.
    resource "azurerm_network_interface" "nicj" {
        name                = var.nic_name
        location            = var.location
        resource_group_name = var.resource_group_name

        ip_configuration {
            name                          = "internal"
            subnet_id                     = var.subnet_id
            private_ip_address_allocation = "Dynamic"
            public_ip_address_id          = var.assign_public_ip ? azurerm_public_ip.jvm_public_ip[0].id : null
        }


    
    }
    resource "azurerm_public_ip" "jvm_public_ip" {
        count               = var.assign_public_ip ? 1 : 0
        name                = var.public_ip_name
        location            = var.location
        resource_group_name = var.resource_group_name
        allocation_method   = "Static"
    }
    resource "azurerm_linux_virtual_machine" "jvm" {
        name                = var.vm_name
        resource_group_name = var.resource_group_name
        location            = var.location
        size                = var.vm_size
        admin_username      = var.admin_username
        admin_password      = var.admin_password
        
        network_interface_ids = [azurerm_network_interface.nicj.id]
        
        disable_password_authentication = false
        os_disk {
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }
        
        source_image_reference {
            publisher = var.vmpublisher
            offer     = var.vmoffer
            sku       = var.vmsku
            version   = var.vmversion
            
        }
        
        
    }