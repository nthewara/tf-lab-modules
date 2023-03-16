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