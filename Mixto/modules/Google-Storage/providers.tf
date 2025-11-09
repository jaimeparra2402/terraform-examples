terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  credentials = file("${path.module}/../../gcp-identity.json")
  project     = var.project_id
  region      = var.region
}
