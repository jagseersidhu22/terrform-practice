variable "nic_name" {
  description = "Name of the network interface"
  type        = string
  
  
}
variable "location" {
  description = "Location for the resources"
  type        = string
  
}
variable "public_ip_name" {
    description = "Name of the public IP address"
    type        = string
  
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  
}
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  
}
variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
  
}
variable "vmpublisher" {
  description = "Publisher of the VM image"
  type        = string
  
}
variable "vmoffer" {
  description = "Offer of the VM image"
  type        = string
  
}
variable "vmsku" {
  description = "SKU of the VM image"
  type        = string
  
}
variable "vmversion" {
  description = "Version of the VM image"
  type        = string
  
}



variable "subnet_id" {
  description = "ID of the subnet where the VM will be deployed"
  type        = string
  
}
variable "assign_public_ip" {
  description = "Boolean to determine if a public IP should be assigned"
  type        = bool
   
}
