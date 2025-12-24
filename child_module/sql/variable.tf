variable "location" {
  type = string
}

variable "sql_location" {
  type        = string
  default     = ""
  description = "Optional override location for SQL resources; empty uses module var.location"
}

variable "resource_group_name" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
} 
