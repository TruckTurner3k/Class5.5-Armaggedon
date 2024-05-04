terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  # Configuration options
    credentials = "exit-the-matrix-1d8cabb81034.json"
    region = "us-central"
    zone = "us-central1-a"
    project = "exit-the-matrix"
}
