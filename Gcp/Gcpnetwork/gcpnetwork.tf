resource "google_compute_network" "gcpnetdc1" {
  name                    = var.name 
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcpnetdc1sub1" {
  name          = "${var.name}-sub1"
  ip_cidr_range = "${var.subnet_addressspace}.10.0/24"
  region        = var.region
  network       = google_compute_network.gcpnetdc1.id
}

resource "google_compute_subnetwork" "gcpnetdc1sub2" {
  name          = "${var.name}-sub2"
  ip_cidr_range = "${var.subnet_addressspace}.20.0/24"
  region        = var.region
  network       = google_compute_network.gcpnetdc1.id
}

resource "google_compute_subnetwork" "gcpnetdc1sub3" {
  name          = "${var.name}-sub3"
  ip_cidr_range = "${var.subnet_addressspace}.30.0/24"
  region        = var.region
  network       = google_compute_network.gcpnetdc1.id
}