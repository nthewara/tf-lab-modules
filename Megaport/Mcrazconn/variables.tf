variable "vxcname" {
  type = string
  default = "ExpressRoute VXC" 
}
variable "azvlan" {
  type = number 
  default = 495
}

variable "mcrid" {
  type = string
}

variable "ercircuit_servicekey" {
  type = string
}