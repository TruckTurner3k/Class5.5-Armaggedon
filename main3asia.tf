# Create another vpc in Asia pacific region.check "name" 
# must be a RFC 1918 192.168 based subnet
# This subnet can only VPN into HQ (10.105.10.0/24)
# Additionally, only port 3389 is open to Asia.
# No 80, no 22 portcheck "name"
# (Hint. VPC Network firewall rules, under "Protocols and Ports" select 
#   specified protocols and ports" . tcp *check* add "3389")
# //To test out, copy the VM IP address then add the port to the end of it.
# For example, if the VM instance ip is 35.224.228.147, enter this in the url and add ".3389" to the end.
# 192.168.0.0/16 mainnet
# 192.168.10.0/16 subnet1
# 192.168.20.0/16 subnet2

resource "google_compute_network" "task3asia_vpcnetwork" {
  name                    = "task3asia-vpcnetwork"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  project                 = "armaggedontask3"
  mtu                     = 1460
}

# First subnet for the Asia Network
resource "google_compute_subnetwork" "task3asia_subnet1" {
  name          = var.subnet_name4
  ip_cidr_range = var.ip_cidr_range4
  region        = var.region1 # The first region to deploy resources
  network       = google_compute_network.task3asia_vpcnetwork.self_link
}
# Second subnet for the Asia Network
resource "google_compute_subnetwork" "task3asia_subnet2" {
  name          = var.subnet_name5
  ip_cidr_range = var.ip_cidr_range5
  region        = var.region2 # The second region to deploy resources
  network       = google_compute_network.task3asia_vpcnetwork.self_link
}

# Create Firewall Rules to Allow Port 3389 Traffic to Asia Network
resource "google_compute_firewall" "allow-port-3389-asia" {
  name    = "allow-port-3389-asia"
  network = google_compute_network.task3asia_vpcnetwork.self_link

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  # Adjust source_ranges to specify IP ranges for Asia
  source_ranges = ["192.168.1.0/24", "192.168.2.0/24"]
}
# Create VPC Peering between Asia VPC and Europe VPC
resource "google_compute_global_address" "asia_vpc_global_address" {
  name          = "asia-vpc-global-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.task3asia_vpcnetwork.self_link
}
resource "google_compute_global_address" "europe_vpc_global_address2" {
  name          = var.europe_vpc_global_address_name_asia
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.task3asia_vpcnetwork.self_link
}
resource "google_compute_network_peering" "asia_to_euro_peering1" {
  name         = "asia-to-euro-peering1"
  network      = google_compute_network.task3asia_vpcnetwork.self_link
  peer_network = google_compute_network.prototype_vpcnetwork.id
}


resource "google_compute_network_peering" "euro_to_asia_peering2" {
  name         = "euro-to-asia-peering2"
  network      = google_compute_network.prototype_vpcnetwork.self_link
  peer_network = google_compute_network.task3asia_vpcnetwork.self_link
}

resource "google_compute_network" "task3asia_peer_vpcnetwork" {
  name                    = "peer-asia"
  auto_create_subnetworks = "false"
}

resource "google_compute_network" "prototype_peer2_vpcnetwork" {
  name                    = "asia2europe"
  auto_create_subnetworks = "false"
}