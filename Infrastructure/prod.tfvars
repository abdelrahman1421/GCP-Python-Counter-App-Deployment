#Firewall Variables

direction     = "INGRESS"
source_ranges = "35.235.240.0/20"
protocol      = "tcp"
firewall_name = "allow-iap"
ports         = ["22", "80"]

###########################

# Router & Nat variables

router_name                             = "router"
nat_name                                = "nat-gw"
nat_ip_allocate_option                  = "AUTO_ONLY"
source_subnetwork_ip_ranges_to_nat_name = "LIST_OF_SUBNETWORKS"

###############################

# VPC variables
vpc_name                = "graduation"
auto_create_subnetworks = false
routing_mode            = "REGIONAL"
mtu                     = 1460

###############################

# Management Subnet variables

management_subnet_name        = "management-subnet"
ip_cidr_range_mang            = "10.0.0.0/24"
region_mang                   = "us-central1"
private_ip_google_access_mang = true

###############################

# Restricted Subnet variables


restricted_subnet_name       = "restricted-subnet"
ip_cidr_range_res            = "10.0.1.0/24"
region_res                   = "us-central1"
private_ip_google_access_res = true

##########################################################

# GKE variables

cluster_name                                        = "project-cluster"
location                                            = "us-central1-a"
remove_default_node_pool                            = true
initial_node_count                                  = 1
master_authorized_networks_cidr_blocks_display_name = "managment-cidr-range"
cluster_ipv4_cidr_block                             = "10.1.0.0/16"
services_ipv4_cidr_block                            = "10.2.0.0/16"
enable_private_nodes                                = true
enable_private_endpoint                             = true
master_ipv4_cidr_block                              = "172.16.0.0/28"
node_pool_name                                      = "nodepool"
node_pool_location                                  = "us-central1-a"
node_count                                          = 3
node_config_preemptible                             = true
node_config_machine_type                            = "e2-standard-2"

##############################

# Service Account variables

service_account_gke_name = "iti-service-account"
project                  = "abde-367812"
gke_role                 = "roles/storage.admin"
service_account_vm_name  = "vm-service-account"
vm_role                  = "roles/container.admin"

###############################

# Private VM variables

vm_name          = "private-vm"
vm_machine_type  = "e2-medium"
zone             = "us-central1-a"
vm_machine_image = "debian-cloud/debian-11"
