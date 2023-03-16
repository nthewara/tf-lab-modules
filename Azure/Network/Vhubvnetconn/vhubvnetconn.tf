resource "azurerm_virtual_hub_connection" "workload_vnet_con" {
  name                      = var.name
  virtual_hub_id            = var.vhubid
  remote_virtual_network_id = var.vnetid
  internet_security_enabled = true
}