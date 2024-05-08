#Create 3 VPCs. 1 In Europe (HQ) 1 in The Americas and 1 in Asia. 
# Both VPCs in The Americas and Asia have 2 Subnets
# This page(HQ VPC) must only be on a RFC 1918 Private 10 net
# Can't be accessible from the Internet (i.e. no external IP)

# Create another vpc in The Americas. 
# The Americas must have 2 regions 
# Both must be RFC 1918 172.16 based subnets.  
# They can peer with HQ (10.105.10.0/24) in order to view the homepage.
# They can only view the page on port 80.

# Create another vpc in Asia pacific region.check "name" {
# must be a RFC 1918 192.168 based subnet
# This subnet can only VPN into HQ (10.105.10.0/24)
# Additionally, only port 3389 is open to Asia.
# No 80, no 22 portcheck "name"
# (Hint. VPC Network firewall rules, under "Protocols and Ports" select "specified protocols and ports . tcp *check* add "3389")
# //To test out, copy the VM IP address then add the port to the end of it.
# For example, if the VM instance ip is 35.224.228.147, enter this in the url and add ".3389" to the end.



# add subnet to the VPC
resource "google_compute_network" "prototype_vpcnetwork" {
  name                    = "prototype-vpcnetwork"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
}

resource "google_compute_subnetwork" "prototype_subnetwork" {
  name          = "prototype-subnet"
  network       = google_compute_network.prototype_vpcnetwork.self_link
  ip_cidr_range = "10.105.10.0/24"
  region        = "europe-west1"
}
# Europe VPC Peering Configuration
resource "google_compute_global_address" "europe_vpc_global_address" {
  name          = var.europe_vpc_global_address_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.prototype_vpcnetwork.id
}

resource "google_compute_global_address" "americas_vpc_global_address" {
  name          = "americas-vpc-global-address2"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.task3americas_vpcnetwork.id
}



resource "google_compute_network_peering" "hqamerica_to_euro_peering1" {
  name         = "hqamerica-to-euro-peering"
  network      = google_compute_network.task3americas_vpcnetwork.self_link
  peer_network = google_compute_network.prototype_vpcnetwork.self_link
}


resource "google_compute_network" "prototype_peer1_vpcnetwork" {
  name                    = "peer-europe"
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "task3americas_peer1_vpcnetwork" {
  name                    = "peer-americas"
  auto_create_subnetworks = "true"
}