variable "region2" {
  type        = string
  description = "The region to deploy resources for subnet1"
  default     = "us-central1"
}
variable "region3" {
  type        = string
  description = "The region to deploy resources for subnet2"
  default     = "us-east1"
}

variable "zone2" {
  type        = string
  description = "The zone to deploy resources"
  default     = "us-central1-b"
}

variable "location2" {
  type        = string
  description = "The location to deploy resources"
  default     = "EU"
}
variable "google_bucket_url2" {
  type        = string
  description = "Google storage bucket URL"
  default     = "https://storage.googleapis.com/"
}


variable "subnet_name2" {
  type        = string
  description = "The name of the first subnet"
  default     = "task3americas-subnet1"
}
variable "subnet_name3" {
  type        = string
  description = "The name of the second subnet"
  default     = "task3americas-subnet2"
}

variable "ip_cidr_range2" {
  type        = string
  description = "IP CIDR range for the americas subnet1"
  default     = "172.16.0.0/24"
}
variable "ip_cidr_range3" {
  type        = string
  description = "IP CIDR range for the americas subnet2"
  default     = "172.16.1.0/24"
}
variable "firewall_name2" {
  type        = string
  description = "The name of the firewall rule"
  default     = "firewall-rule"
}

