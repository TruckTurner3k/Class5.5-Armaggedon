# # Both VPCs in The Americas and Asia have 2 Subnets

# Create another vpc in The Americas. 
# The Americas must have 2 regions 
# Both must be RFC 1918 172.16 based subnets.  
# They can peer with HQ (10.105.10.0/24) in order to view the homepage.
# They can only view the page on port 80.
#172.16.0.0/24 main net
#172.16.10.0/24 subnet1
#172.16.20.0/24 subnet2
resource "google_compute_network" "task3americas_vpcnetwork" {
  name                    = "task3americas-vpcnetwork"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  project                 = "armaggedontask3"
  mtu                     = 1460
  
}

# First subnet for the Americas Network
resource "google_compute_subnetwork" "task3americas_subnet1" {
  name          = var.subnet_name2
  ip_cidr_range = var.ip_cidr_range2
  region        = var.region1 # The first region to deploy resources
  network       = google_compute_network.task3americas_vpcnetwork.self_link
}
# Second subnet for the Americas Network
resource "google_compute_subnetwork" "task3americas_subnet2" {
  name          = var.subnet_name3
  ip_cidr_range = var.ip_cidr_range3
  region        = var.region1 # The first region to deploy resources
  network       = google_compute_network.task3americas_vpcnetwork.self_link
}

# Create Firewall Rules to Allow Port 80 Traffic
resource "google_compute_firewall" "allow_port_80" {
  name    = "allow-port-80"
  network = google_compute_network.task3americas_vpcnetwork.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

## Americas VPC Peering Configuration
resource "google_compute_global_address" "americas_vpc_global_address1" {
  name          = "americas-vpc-global-address1"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.task3americas_vpcnetwork.self_link
}
resource "google_compute_global_address" "europe_vpc_global_address_name_americas" {
  name          = var.europe_vpc_global_address_name_americas
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.task3americas_vpcnetwork.self_link
}



resource "google_compute_network" "task3americas_peer2_vpcnetwork" {
  name                    = "task3americas-peer2-vpcnetwork"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "prototype_peer3_vpcnetwork" {
  name                    = "america2prototype-vpcnetwork"
  auto_create_subnetworks = "true"
}
