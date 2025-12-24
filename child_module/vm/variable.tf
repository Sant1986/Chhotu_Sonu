variable "name" {}
variable "location" {}
variable "vm_location" {
  type        = string
  default     = ""
  description = "Optional override location for the VM; if empty, uses var.location"
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "VM size to use for the virtual machine. Override if the requested SKU is not available in the region."
}

variable "resource_group_name" {}
variable "nic_id" {}
variable "admin_username" {}
variable "key_vault_id" {}

