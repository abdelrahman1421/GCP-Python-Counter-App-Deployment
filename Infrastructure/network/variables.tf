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
