variable "name" {
  type = string
}
variable "networkname" {
  type = string
}

variable "region" {
  type = string
  default = "us-east4"
}

variable "subnet_addressspace" {
  type = string
  default = "10.150"
}