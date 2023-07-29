resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type 
  zone         = var.zone 

  boot_disk {
    initialize_params {
      image = var.image 
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral public IP
    }
  }
}