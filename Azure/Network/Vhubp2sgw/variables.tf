variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vhubid" {
  type = string 
}
variable "scale_units" {
  type = number
  default = 1
}

variable "address_prefix" {
  type = string
}

variable "vpn_server_configuration" {
  type = string 
}