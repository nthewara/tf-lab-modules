terraform {
  required_providers {
    megaport = {
      source = "megaport/megaport"
      version = "0.2.10"
    }
  }
}

resource "megaport_gcp_connection" "gcpcon" {
  vxc_name   = "GCP VXC"
  rate_limit = 50
lifecycle {
    ignore_changes = [a_end_mcr_configuration]
  }
  a_end {
    requested_vlan = var.vlan
    port_id = var.mcrid
  }

  csp_settings {
    # pairing_key = google_compute_interconnect_attachment.on_prem.pairing_key
    pairing_key = var.pairing_key
  }
}