
resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["${var.address_space}.0/23"]
}

resource "azurerm_subnet" "hub_gatewaysubnet" {
  count               = var.type != "spoke" ? 1 : 0
  name                 = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.0/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "hub_nva" {
  count               = var.type != "spoke" ? 1 : 0
  name                 = "nva"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.64/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  count               = var.type != "spoke" ? 1 : 0
  name                 = "AzureFirewallSubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.128/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "RouteServerSubnet" {
  count               = var.type == "routeserver" ? 1 : 0
  name                 = "RouteServerSubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.192/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  count               = var.type == "bastion" ? 1 : 0
  name                 = "AzureBastionSubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.192/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "spoke_app" {
  count               = var.type == "spoke" ? 1 : 0
  name                 = "app"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.0/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "spoke_data" {
  count               = var.type == "spoke" ? 1 : 0
  name                 = "data"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.64/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "spoke_appgw" {
  count               = var.type == "spoke" ? 1 : 0
  name                 = "appgw"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space}.128/26"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  security_rule {
    name                       = "SSH-In"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.myip
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-spoke-app" {
  count               = var.type == "spoke" ? 1 : 0
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.spoke_app[0].id
}
resource "azurerm_subnet_network_security_group_association" "nsg-spoke-data" {
  count               = var.type == "spoke" ? 1 : 0
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.spoke_data[0].id
}

resource "azurerm_subnet_network_security_group_association" "nsg-hub-nva" {
   count               = var.type != "spoke" ? 1 : 0
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.hub_nva[0].id
}
