resource "azurerm_mssql_server" "sql" {
  name                         = "sonu-sql-server"
  resource_group_name          = var.resource_group_name
  location                     = var.sql_location != "" ? var.sql_location : var.location
  version                      = "12.0"
  administrator_login          = "sonusqladmin"
  administrator_login_password = var.admin_password
} 

resource "azurerm_mssql_database" "db" {
  name      = "sonu-db"
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "Basic"
}
