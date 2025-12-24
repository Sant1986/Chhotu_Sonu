resource "azurerm_resource_group" "rg" {
  name     = "sonurgs"
  location = "westeurope"
}


output "rg_name" {
  value = azurerm_resource_group.rg.name
}
