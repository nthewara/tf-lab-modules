variable "vxcname" {
  type = string
  default = "ExpressRoute VXC" 
}
variable "azvlan" {
  type = number 
  default = 495
}

variable "mcrasn" {
  type = number 
  default = 64555
}

variable "mcrid" {
  type = string
}

variable "primary_subnet" {
  type = string
  default = "169.254.120.129/30"
}

variable "secondary_subnet" {
  type = string
  default = "169.254.239.137/30"
}

variable "ercircuit_servicekey" {
  type = string
}