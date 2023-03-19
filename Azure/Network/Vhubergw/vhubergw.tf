resource "azurerm_express_route_gateway" "ergw" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = var.vhubid
  scale_units         = var.scale_units
}