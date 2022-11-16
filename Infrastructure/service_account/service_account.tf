resource "google_service_account" "iti-service-account" {
  account_id = var.service_account_gke_name
  project    = var.project
}

resource "google_project_iam_binding" "iti-service-account-iam" {
  project = var.project
  role    = var.gke_role
  members = [
    "serviceAccount:${google_service_account.iti-service-account.email}"
  ]
}

resource "google_service_account" "vm-service-account" {
  account_id = var.service_account_vm_name
  project    = var.project
}

resource "google_project_iam_binding" "vm-service-account-iam" {
  project = var.project
  role    = var.vm_role
  members = [
    "serviceAccount:${google_service_account.iti-service-account.email}"
  ]
}