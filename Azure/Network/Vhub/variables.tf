variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vwanid" {
  type = string 
}

variable "address_prefix" {
  type = string
}

variable "hub_routing_preference" {
  type = string
  default = "ASPath"
}