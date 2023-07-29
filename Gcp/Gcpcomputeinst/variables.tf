variable "name" {
  type = string
}

variable "machine_type" {
  type = string
  default = "e2-small"
}

variable "zone" {
  type = string
  default = "us-east4-c"
}

variable "subnetwork" {
  type = string
}

variable "image" {
  type = string
  default = "ubuntu-1804-bionic-v20220805"
}