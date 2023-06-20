output "id" {
  value = azurerm_linux_virtual_machine.vm.*.id
}
output "vmprivateip" {
  value = azurerm_network_interface.vmnic.*.private_ip_address
}