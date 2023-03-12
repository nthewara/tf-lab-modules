resource "azurerm_public_ip" "vmpip" {
  name                = "${var.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_network_interface" "vmnic" {
  name                = "${var.name}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vmpip.id
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${var.name}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                            = var.vmsku
  admin_username                  = var.username
  network_interface_ids = [
    azurerm_network_interface.vmnic.id,
  ]
  admin_ssh_key {
    username = var.username
    public_key = var.sshkey
  }

  source_image_reference {
    publisher = var.vmimage.publisher
    offer     = var.vmimage.offer 
    sku       = var.vmimage.sku
    version   = var.vmimage.version
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
resource "azurerm_virtual_machine_extension" "vm1-watcher" {
  name                 = "${var.name}-vm-watext"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  auto_upgrade_minor_version = true
}