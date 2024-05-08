variable "region4" {
  type        = string
  description = "The region to deploy resources for subnet1"
  default     = "asia-east1"
}
variable "region5" {
  type        = string
  description = "The region to deploy resources for subnet2"
  default     = "asia-southeast1"
}

variable "zone3" {
  type        = string
  description = "The zone to deploy resources"
  default     = "asia-east1-a"
}

variable "location3" {
  type        = string
  description = "The location to deploy resources"
  default     = "asia"
}
variable "google_bucket_url3" {
  type        = string
  description = "Google storage bucket URL"
  default     = "https://storage.googleapis.com/"
}

variable "subnet_name4" {
  type        = string
  description = "The name of the first subnet"
  default     = "task3asia-subnet1"
}
variable "subnet_name5" {
  type        = string
  description = "The name of the second subnet"
  default     = "task3asia-subnet2"
}

variable "ip_cidr_range4" {
  type        = string
  description = "IP CIDR range for the asia subnet1"
  default     = "192.168.1.0/24"
}
variable "ip_cidr_range5" {
  type        = string
  description = "IP CIDR range for the asia subnet2"
  default     = "192.168.2.0/24"
}
variable "firewall_name3" {
  type        = string
  description = "The name of the firewall rule"
  default     = "firewall-rule"
}
