variable "name" {
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

variable "myip" {
  type = string
}