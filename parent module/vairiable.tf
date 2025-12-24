variable "location" {
  description = "Default region for resources"
  default     = "eastus"

  validation {
    condition     = length(var.location) > 0
    error_message = "variable 'location' must not be empty"
  }
}

variable "admin_username" {
  default = "azureadmin"
}

variable "admin_password" {
  default = "Password@12345"
}

variable "vm_location" {
  description = "Optional override location for VM resources; empty means use `location`. Default set to 'eastus' to improve SKU availability."
  default     = "eastus"
}

variable "vm_size" {
  description = "VM size to use for VM module. Default 'Standard_D2s_v3'."
  default     = "Standard_D2s_v3"
}

variable "sql_location" {
  description = "Optional override location for SQL resources; empty uses `location`"
  default     = "eastus"
}  
