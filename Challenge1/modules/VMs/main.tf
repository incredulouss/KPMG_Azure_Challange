

resource "azurerm_virtual_network" "Vnet1" {
  name                = "frontend-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resourceGroupName
}
output "output_vnet1" {
  value          = azurerm_virtual_network.Vnet1.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "internal"
  resource_group_name  = var.resourceGroupName
  virtual_network_name = azurerm_virtual_network.Vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}
output "output_subnet1" {
  value = azurerm_subnet.subnet1.name
}

resource "azurerm_network_interface" "NIC1" {
  name                = "nic1"
  location            = var.location
  resource_group_name = var.resourceGroupName

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface" "NIC2" {
  name                = "nic2"
  location            = var.location
  resource_group_name = var.resourceGroupName

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

#This will create the First VM for frontend

resource "azurerm_windows_virtual_machine" "Vm1_frontend" {
  name                = "vm1"
  resource_group_name = var.resourceGroupName
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.NIC1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

#This will create the second VM for frontend

resource "azurerm_windows_virtual_machine" "Vm2_frontend" {
  name                = "vm2"
  resource_group_name = var.resourceGroupName
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser1"
  admin_password      = "P@$$w0rd12345!"
  network_interface_ids = [
    azurerm_network_interface.NIC2.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "outer_loadbalencer" {
  name                = "PublicIPForOuterLB"
  location            = var.location
  resource_group_name = var.resourceGroupName
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.resourceGroupName

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.outer_loadbalencer.id
  }
}