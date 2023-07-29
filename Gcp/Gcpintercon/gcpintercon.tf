resource "google_compute_interconnect_attachment" "on_prem" {
  name                     = var.name
  type                     = "PARTNER"
  router                   = var.routerid
  mtu                      = 1500
  admin_enabled            = true
}