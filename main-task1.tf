terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

# Specify the Google Cloud provider
provider "google" {
  credentials = file ("exit-the-matrix-1d8cabb81034.json")
  project     = "exit-the-matrix"
  region      = "us-central1"
}
# Create a storage bucket
resource "google_storage_bucket" "public_bucket" {
  name     = "armaggedon-public-bucket"
  location = "us-central1"

  # Make the bucket publicly accessible
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

# Upload index.html file to the bucket
resource "google_storage_bucket_object" "index_file" {
  name   = "index.html"
  bucket = google_storage_bucket.public_bucket.name  # Use the bucket name attribute
  source = "index.html"
  content_type = "text/html"
}

# Output the public URL of the bucket
output "bucket_url" {
  value = google_storage_bucket.public_bucket.self_link
}
