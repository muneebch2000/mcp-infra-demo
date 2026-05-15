terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    cloudflare = {
  source  = "cloudflare/cloudflare"
  version = "~> 4.0"
}
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# GCP Storage Bucket (stores MCP server logs/configs)
resource "google_storage_bucket" "mcp_bucket" {
  name          = "${var.gcp_project_id}-mcp-storage"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

# GCP Service Account for CI/CD
resource "google_service_account" "mcp_sa" {
  account_id   = "mcp-deploy-sa"
  display_name = "MCP Deploy Service Account"
}

# Give service account access to the bucket
resource "google_storage_bucket_iam_member" "mcp_sa_access" {
  bucket = google_storage_bucket.mcp_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.mcp_sa.email}"
}