resource "azurerm_express_route_connection" "erc-con1" {
  name                             = var.name
  express_route_gateway_id         = var.ergwid
  express_route_circuit_peering_id = "${var.ercid}/peerings/AzurePrivatePeering"
}
