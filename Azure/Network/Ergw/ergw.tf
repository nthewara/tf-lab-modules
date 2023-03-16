
resource "azurerm_public_ip" "erpip1" {
  name                = var.erpipname
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
  sku = "Standard"
}
resource "azurerm_virtual_network_gateway" "ergw1" {
  name                = var.ergwname
  location            = var.location
  resource_group_name = var.resource_group_name
  type     = "ExpressRoute"
  sku           = var.sku_name
  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.erpip1.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}