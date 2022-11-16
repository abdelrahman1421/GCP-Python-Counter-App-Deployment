resource "google_compute_instance" "private-vm" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.vm_machine_image
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}