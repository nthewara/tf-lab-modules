variable "ercname" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "skutier" {
  type = string
  default = "Standard"
}

variable "service_provider_name" {
  type = string 
  default = "Megaport"
}

variable "peering_location" {
  type = string
  default = "Washington DC"
}

variable "er_sku_family" {
  type = string 
  default = "MeteredData"
}