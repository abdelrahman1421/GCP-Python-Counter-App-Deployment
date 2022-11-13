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

resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.restricted-subnet.region
  network = google_compute_network.project-vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.management-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}