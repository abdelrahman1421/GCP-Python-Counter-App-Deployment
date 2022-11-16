resource "google_compute_subnetwork" "management-subnet" {
  name          = var.management_subnet_name
  ip_cidr_range = var.ip_cidr_range_mang
  region        = var.region_mang
  network       = google_compute_network.iti-vpc.id
  private_ip_google_access = var.private_ip_google_access_mang

  
}
