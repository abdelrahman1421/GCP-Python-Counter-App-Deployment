resource "google_compute_network" "project-vpc" {
  name                    = "project-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

