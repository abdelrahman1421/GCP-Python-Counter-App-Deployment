resource "google_compute_firewall" "allow-iap" {
  name    = var.firewall_name
  description = var.description
  network = google_compute_network.iti-vpc.id
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  direction     = var.direction
  source_ranges = [var.source_ranges]
}

resource "google_compute_firewall" "allow-google-APIs" {
  name    = var.firewall_name_1
  description = var.description_1
  network = google_compute_network.iti-vpc.id
  allow {
    protocol = var.protocol_1
    ports    = var.ports_1
  }
  direction     = var.direction_1
  source_ranges = [var.source_ranges_1]
}