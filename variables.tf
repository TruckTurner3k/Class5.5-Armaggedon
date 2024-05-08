# Variables shared across all 3 VPCs

# project     = var.project_id
#   region      = var.region
#   zone        = var.zone
#   credentials = var.credentials

variable "project_id" {
  type        = string
  description = "The project ID to deploy resources"
  default     = "armaggedontask3"
}
variable "credentials" {
  type        = string
  description = "The path to the service account key file"
  default     = "armaggedontask3-30344a52dcd4.json"
}
variable "europe_vpc_global_address_name_americas" {
  type        = string
  description = "Name of the global address for the Europe VPC to Americas"
  default     = "europe-vpc-global-address1"
}
variable "europe_vpc_global_address_name_asia" {
  type        = string
  description = "Name of the global address for the Europe VPC to Asia"
  default     = "europe-vpc-global-address2"
}
variable "europe_vpc_global_address_name" {
  type        = string
  description = "Name of the global address for the Europe VPC to Americas"
  default     = "europe-vpc-global-address"
}