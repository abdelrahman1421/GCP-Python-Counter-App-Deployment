resource "google_compute_subnetwork" "restricted-subnet" {
  name          = var.restricted_subnet_name
  ip_cidr_range = var.ip_cidr_range_res
  region        = var.region_res
  network       = google_compute_network.iti-vpc.id
  private_ip_google_access = var.private_ip_google_access_res
  
}


