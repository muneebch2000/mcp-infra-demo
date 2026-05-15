variable "gcp_project_id" {
  description = "Your GCP Project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP Region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
}