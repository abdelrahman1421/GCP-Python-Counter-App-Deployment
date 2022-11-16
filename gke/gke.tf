resource "google_container_cluster" "private-cluster" {
  name                     = var.cluster_name
  location                 = var.location
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  network                  = var.vpc_network
  subnetwork               = var.vpc_subnetwork


  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_networks_cidr_blocks
      display_name = var.master_authorized_networks_cidr_blocks_display_name
  }
    }
  

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

}

resource "google_container_node_pool" "nodepool" {
  name       = var.node_pool_name
  location   = var.node_pool_location
  cluster    = google_container_cluster.private-cluster.id
  node_count = var.node_count

  node_config {
    preemptible     = var.node_config_preemptible
    machine_type    = var.node_config_machine_type
    service_account = var.node_config_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}