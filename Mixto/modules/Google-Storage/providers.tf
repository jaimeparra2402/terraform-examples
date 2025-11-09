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
  project     = var.gcp_project
  region      = "europe-southwest1"   
}
