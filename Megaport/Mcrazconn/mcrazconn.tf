terraform {
  required_providers {
    megaport = {
      source = "megaport/megaport"
      version = "0.2.5"
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
    requested_vlan = var.azvlan
    port_id = var.mcrid
  }
  csp_settings {
    service_key = var.ercircuit_servicekey
    peerings {
      private_peer = true
    }
  }
}
