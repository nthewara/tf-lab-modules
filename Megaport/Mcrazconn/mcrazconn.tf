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
      peer_asn         = "64555"
      primary_subnet   = "169.254.120.129/30"
      #secondary_subnet = "10.0.0.4/30"
      requested_vlan   = 450
    }
  }
}
