terraform {
  required_providers {
    megaport = {
      source = "megaport/megaport"
      version = "0.2.10"
    }
  }
}
data "megaport_location" "mcrlocation" {
  name    = var.mcrlocation
  has_mcr = true
}
resource "megaport_mcr" "mcr" {
  mcr_name    = var.mcrname
  location_id = data.megaport_location.mcrlocation.id
  router {
    port_speed    = 1000
    requested_asn = 64555
  }
}