resource "azurerm_virtual_hub" "vhub" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.vwanid
  address_prefix      = "${var.address_prefix}.0/23"
  hub_routing_preference = var.hub_routing_preference
}