variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "vmsku" {
  type = string
  default = "Standard_B1ms"
}
variable "subnetid" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "sshkey" {
  type = string
}
variable "publicip" {
  type = bool
}

variable "accelnet" {
  type = bool
}

variable "vmimage" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

