resource "azurerm_postgresql_server" "example" {
  name                = "postgresql-server-1"
  location            = azurerm_resource_group.example.location
  resource_group_name = var.rg_name
  sku_name = var.sku
  storage_mb                   = var.storage
  backup_retention_days        = var.backup_days
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_pwd
  version                      = var.ver
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_configuration" "example" {
     name                = "connection_throttling"
     resource_group_name = var.rg_name
     server_name         = azurerm_postgresql_server.example.name
     value               = "on"
}
