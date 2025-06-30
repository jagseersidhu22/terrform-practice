locals {

    vm_matrix = { 
         frontend = { 
            vm_name = "vm-frontendjs"
            vm_size = "Standard_B1s"
            admin_username = data.azurerm_key_vault_secret.jvm_secret.value
            admin_password = data.azurerm_key_vault_secret.jvm_secretp.value
            vmpublisher = "Canonical"
            vmoffer = "0001-com-ubuntu-server-jammy"
            vmsku = "22_04-lts"
            vmversion = "latest"
            assign_public_ip = true
            nic_name = "nic-frontendjs"
            public_ip_name = "pip-frontendjs"
            network_security_group_name = "nsg-frontendjs"
          } ,
          backend = { 
            vm_name = "vm-backendjs"
            vm_size = "Standard_B1s"
            admin_username = data.azurerm_key_vault_secret.jvm_secretbk.value
            admin_password = data.azurerm_key_vault_secret.jvm_secretbkp.value
            vmpublisher = "Canonical"
            vmoffer = "ubuntuServer"
            vmsku = "20_04-lts"
            vmversion = "latest"
            assign_public_ip = false
            nic_name = "nic-backendjs"
            public_ip_name = "pip-backendjs"
            network_security_group_name = "nsg-backendjs"
          }
}

}