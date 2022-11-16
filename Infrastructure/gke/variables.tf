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

variable "vpc_network" {
    type = string
}

variable "vpc_subnetwork" {
    type = string
}

variable "master_authorized_networks_cidr_blocks" {
    type = string
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

variable "node_config_service_account" {
    type = string
}