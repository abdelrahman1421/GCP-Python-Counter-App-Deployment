resource "google_compute_network" "project-vpc" {
  name                    = "project-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.project-vpc.id
  secondary_ip_range {
    range_name    = "management-subnet-secondary-range"
    ip_cidr_range = "192.168.0.0/24"
  }
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.project-vpc.id
  secondary_ip_range {
    range_name    = "restricted-subnet-secondary-range"
    ip_cidr_range = "192.168.1.0/24"
  }
}
