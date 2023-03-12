resource "azurerm_express_route_circuit" "er" {
  name                = var.ercname
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [  ]
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = 50
  sku {
    tier   = var.skutier
    family = var.er_sku_family
  }
}
