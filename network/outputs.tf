output "vpc_id" {
    value = google_compute_network.iti-vpc.id
}

output "management_subnet_id" {
    value = google_compute_subnetwork.management-subnet.id
}

output "restricted_subnet_id" {
    value = google_compute_subnetwork.restricted-subnet.id
}