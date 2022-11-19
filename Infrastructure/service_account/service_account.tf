resource "google_service_account" "iti-service-account" {
  account_id = var.service_account_gke_name
  project    = var.project
}


resource "google_project_iam_custom_role" "gke-custom-role" {
  role_id     = "gke_custom_role"
  title       = "gke-custom-role"
  description = "gke-custom-role"
  permissions = ["storage.buckets.get","storage.buckets.list","storage.buckets.update","storage.objects.get","storage.objects.list","storage.objects.update"]
}

resource "google_project_iam_binding" "iti-service-account-iam" {
  project = var.project
  role    = "projects/${var.project}/roles/${google_project_iam_custom_role.gke-custom-role.role_id}"
  members = [
    "serviceAccount:${google_service_account.iti-service-account.email}"
  ]
}
##########################################################################################

resource "google_service_account" "vm-service-account" {
  account_id = var.service_account_vm_name
  project    = var.project
}

resource "google_project_iam_binding" "vm-service-account-iam" {
  project = var.project
  role    = var.vm_role
  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}"
  ]
}

resource "google_project_iam_custom_role" "vm-custom-role" {
  role_id     = "vm_custom_role"
  title       = "vm-custom-role"
  description = "vm-custom-role"
  permissions = ["storage.buckets.get","storage.buckets.list","storage.buckets.update","storage.buckets.create","storage.objects.get","storage.objects.list","storage.objects.update","storage.objects.create"]
}

resource "google_project_iam_binding" "iti-service-account-iam-vm" {
  project = var.project
  role    = "projects/${var.project}/roles/${google_project_iam_custom_role.vm-custom-role.role_id}"
  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}"
  ]
}
