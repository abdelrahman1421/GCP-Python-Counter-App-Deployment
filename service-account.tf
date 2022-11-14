
#create service account for vm to access cluster
resource "google_service_account" "vm_service_account" {
  account_id   = "vm-service-account"
}

#add role to vm service account 
resource "google_project_iam_binding" "vm_role" {
  project = "abde-367812"
  role    = "roles/container.admin" 
  members = [
    "serviceAccount:${google_service_account.vm_service_account.email}"
  ]
}

#create service account for gke cluster
resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
}

#add role for gke service account to get access to storage -buckets&objects-
resource "google_project_iam_binding" "gke_role" {
  project = "abde-367812"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}"
  ]
}