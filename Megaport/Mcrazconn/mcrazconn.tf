terraform {
  required_providers {
    megaport = {
      source = "megaport/megaport"
      version = "0.2.10"
    }
  }
}
resource megaport_azure_connection azercon1 {
  vxc_name = var.vxcname
  rate_limit =50

  lifecycle {
    ignore_changes = [a_end_mcr_configuration]
  }

  a_end {
    requested_vlan = 0
    port_id = var.mcrid
  }
  csp_settings {
    service_key = var.ercircuit_servicekey
    private_peering {
      peer_asn         = var.mcrasn
      primary_subnet   = var.primary_subnet
      secondary_subnet = var.secondary_subnet
      requested_vlan   = var.azvlan
    }
  }
}
