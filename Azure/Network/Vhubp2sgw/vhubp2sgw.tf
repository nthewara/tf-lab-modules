
resource "azurerm_point_to_site_vpn_gateway" "vhubp2s" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = var.vhubid
  vpn_server_configuration_id = var.vpn_server_configuration
  scale_unit                  = var.scale_units
  connection_configuration {
    name = "p2sgwconfig"
    vpn_client_address_pool {
      address_prefixes = [
        "${var.address_prefix}.0/24"
      ]
    }
  }
}
