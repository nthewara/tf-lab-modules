output "id" {
  value = azurerm_virtual_network.vnet.id
}
output "name" {
  value = azurerm_virtual_network.vnet.name
}
output "gwsubnetid" {
  value = azurerm_subnet.hub_gatewaysubnet.*.id
}
output "fwsubnetid" {
  value = azurerm_subnet.AzureFirewallSubnet.*.id
}
output "appsubnetid" {
  value = azurerm_subnet.spoke_app.*.id
}
output "hubnvasubnetid" {
  value = azurerm_subnet.hub_nva.*.id
}
