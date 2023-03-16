resource "azurerm_virtual_network_gateway_connection" "ercon" {
  name                = var.erconnname
  location            = var.location
  resource_group_name = var.resource_group_name
  type                       = "ExpressRoute"
  virtual_network_gateway_id = var.gwid
  express_route_circuit_id = var.ercid
}
