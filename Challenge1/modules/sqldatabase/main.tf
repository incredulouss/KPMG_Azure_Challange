
resource "azurerm_sql_server" "example" {
  name                         = "myexamplesqlserver"
  resource_group_name          = var.resourceGroupName
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

}

resource "azurerm_storage_account" "example" {
  name                     = "examplesa"
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "example" {
  name                = "myexamplesqldatabase"
  resource_group_name = var.resourceGroupName
  location            = var.location
  server_name         = azurerm_sql_server.example.name
}
  output "output_sqldatabase" {
  value          = azurerm_sql_database.example.name
}