resource "google_compute_router" "router" {
  name    = var.router_name
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.iti-vpc.id
}

resource "google_compute_router_nat" "nat-gw" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat_name

}