

resource "azurerm_resource_group" "RG1" {
  name     = var.resourceGroupName
  location = var.location
}

module VMs {
  source = "./modules/VMs"
  resourceGroupName  = var.resourceGroupName
  location = var.location
}

module sqldatabase {
  source = "./modules/sqldatabase"
  resourceGroupName  = var.resourceGroupName
  location = var.location
}
