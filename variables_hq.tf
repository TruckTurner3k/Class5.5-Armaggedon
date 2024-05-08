variable "region1" {
  type        = string
  description = "The region to deploy resources"
  default     = "europe-west1"
}

variable "zone1" {
  type        = string
  description = "The zone to deploy resources"
  default     = "eu-west1-b"
}

variable "location1" {
  type        = string
  description = "The location to deploy resources"
  default     = "EU"
}
variable "google_bucket_url1" {
  type        = string
  description = "Google storage bucket URL"
  default     = "https://storage.googleapis.com/"
}


variable "firewall_name1" {
  type        = string
  description = "The name of the firewall rule"
  default     = "firewall-rule"
}

variable "ports1" {
  type        = list(string)
  description = "Ports to open on the firewall"
  default     = ["80"]
}