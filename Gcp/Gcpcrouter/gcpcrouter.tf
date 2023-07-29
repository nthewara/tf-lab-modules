resource "google_compute_router" "gcpcr" {
  name    = var.name
  network = var.networkname
  bgp {
    asn = 16550
  }
}