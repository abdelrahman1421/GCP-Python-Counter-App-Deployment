output "gke_service_account" {
    value = google_service_account.iti-service-account.email
}

output "vm_service_account" {
    value = google_service_account.vm-service-account.email
}

