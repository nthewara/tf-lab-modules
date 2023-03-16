resource "azurerm_virtual_network_peering" "hubtospoke" {
  name                      = "${var.hubvnet}-peeringto-${var.spokevnet}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.hubvnet 
  remote_virtual_network_id = var.spokevnetid
  allow_forwarded_traffic = true
  allow_gateway_transit = var.gwtransit 
}

resource "azurerm_virtual_network_peering" "spoketohub" {
  name                      = "${var.spokevnet}-peeringto-${var.hubvnet}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spokevnet
  remote_virtual_network_id = var.hubvnetid
  allow_forwarded_traffic = true
  use_remote_gateways = var.remotegw
}