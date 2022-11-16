# Firewall variables

variable "direction" {
    type = string
}
variable "source_ranges" {
    type = string
}

variable "protocol" {
    type = string 
    
}

variable "firewall_name" {
    type = string
}

variable "ports" {
    type = list
}
###############################

# Router & Nat variables

variable "router_name" {
    type = string
}
variable "nat_name" {
    type = string
}

variable "nat_ip_allocate_option" {
    type = string 
    
}

variable "source_subnetwork_ip_ranges_to_nat_name" {
    type = string
}

###############################

# VPC variables

variable "vpc_name" {
    type = string
}
variable "auto_create_subnetworks" {
    type = bool
}

variable "routing_mode" {
    type = string 
    
}

variable "mtu" {
    type = number
}

###############################

# Management Subnet variables

variable "management_subnet_name" {
    type = string
}

variable "ip_cidr_range_mang" {
    type = string 
    
}

variable "region_mang" {
    type = string
}

variable "private_ip_google_access_mang" {
    type = bool
}

###############################

# Restricted Subnet variables

variable "restricted_subnet_name" {
    type = string
}

variable "ip_cidr_range_res" {
    type = string 
    
}

variable "region_res" {
    type = string
}

variable "private_ip_google_access_res" {
    type = bool
}
#################################
#################################

# GKE variables
variable "cluster_name" {
    type = string
}

variable "location" {
    type = string
}

variable "remove_default_node_pool" {
    type = bool
}

variable "initial_node_count" {
    type = number
}

variable "master_authorized_networks_cidr_blocks_display_name" {
    type = string
}
variable "cluster_ipv4_cidr_block" {
    type = string
}

variable "services_ipv4_cidr_block" {
    type = string
}

variable "enable_private_nodes" {
    type = bool
}

variable "enable_private_endpoint" {
    type = bool
}

variable "master_ipv4_cidr_block" {
    type = string
}

variable "node_pool_name" {
    type = string
}

variable "node_pool_location" {
    type = string
}

variable "node_count" {
    type = number
}

variable "node_config_preemptible" {
    type = bool
}

variable "node_config_machine_type" {
    type = string
}




####################################
###################################

# Service Account variables

variable "service_account_gke_name" {
    type = string
}

variable "project" {
    type = string
}

variable "gke_role" {
    type = string
}

variable "service_account_vm_name" {
    type = string
}

variable "vm_role" {
    type = string
}

####################################
###################################

# Private VM variables

variable "vm_name" {
    type = string
}

variable "vm_machine_type" {
    type = string
}

variable "vm_machine_image" {
    type = string
}

variable "zone" {
    type = string
}

