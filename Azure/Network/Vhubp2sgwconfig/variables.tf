variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
# variable "vhubid" {
#   type = string 
# }
variable "aad_tenant" {
  type = string 
}
variable "aad_vpnappid" {
  type = string 
}
variable "vpn_protocols" {  
  type = list(string)
  default = ["OpenVPN"]
  description = "OpenVPN, SSTP, IKEv2"
}

variable "vpn_authentication_types" { 
  type = list(string)
  default = ["AAD"]
  description = "AAD, RSA, EAPTLS, EAPMSCHAPv2"
}