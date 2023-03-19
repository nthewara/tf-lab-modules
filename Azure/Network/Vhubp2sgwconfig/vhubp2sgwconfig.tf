resource "azurerm_vpn_server_configuration" "p2sconfig" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  vpn_authentication_types = var.vpn_authentication_types
  vpn_protocols = var.vpn_protocols
  azure_active_directory_authentication {
    tenant = "https://login.microsoftonline.com/${var.aad_tenant}"
    audience = var.aad_vpnappid
    issuer = "https://sts.windows.net/${var.aad_tenant}/"
  }
}
