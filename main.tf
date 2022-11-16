module "network" {
    source = "./network"
    direction = var.direction
    source_ranges = var.source_ranges
    protocol = var.protocol
    firewall_name = var.firewall_name
    ports = var.ports
    router_name = var.router_name
    nat_name = var.nat_name
    nat_ip_allocate_option = var.nat_ip_allocate_option
    source_subnetwork_ip_ranges_to_nat_name = var.source_subnetwork_ip_ranges_to_nat_name
    vpc_name = var.vpc_name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode = var.routing_mode
    mtu = var.mtu
    management_subnet_name = var.management_subnet_name
    ip_cidr_range_mang = var.ip_cidr_range_mang
    region_mang = var.region_mang
    private_ip_google_access_mang = var.private_ip_google_access_mang
    restricted_subnet_name = var.restricted_subnet_name
    ip_cidr_range_res = var.ip_cidr_range_res
    region_res = var.region_res
    private_ip_google_access_res = var.private_ip_google_access_res
}

module "service_account" {
    source = "./service_account"
    service_account_gke_name = var.service_account_gke_name
    project = var.project
    gke_role = var.gke_role
    service_account_vm_name = var.service_account_vm_name
    vm_role = var.vm_role 
}

module "vm" {
    source = "./vm"
    vm_name = var.vm_name
    vm_machine_type = var.vm_machine_type
    vm_machine_image = var.vm_machine_image
    zone = var.zone
    network = module.network.vpc_id
    subnetwork = module.network.management_subnet_id
    service_account_email = module.service_account.vm_service_account
    
}

module "gke" {
    source = "./gke"
    cluster_name = var.cluster_name
    location = var.location
    remove_default_node_pool = var.remove_default_node_pool
    initial_node_count = var.initial_node_count
    vpc_network = module.network.vpc_id
    vpc_subnetwork = module.network.restricted_subnet_id
    master_authorized_networks_cidr_blocks = var.ip_cidr_range_mang
    master_authorized_networks_cidr_blocks_display_name = var.master_authorized_networks_cidr_blocks_display_name
    cluster_ipv4_cidr_block = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
    enable_private_nodes = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
    node_pool_name = var.node_pool_name
    node_pool_location = var.node_pool_location
    node_count = var.node_count
    node_config_preemptible = var.node_config_preemptible
    node_config_machine_type = var.node_config_machine_type
    node_config_service_account = module.service_account.gke_service_account


}