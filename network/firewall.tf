resource "google_compute_firewall" "allow-iap" {
  name    = var.firewall_name
  network = google_compute_network.iti-vpc.id
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  direction     = var.direction
  source_ranges = [var.source_ranges]
}