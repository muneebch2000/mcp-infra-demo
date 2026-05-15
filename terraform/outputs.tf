output "mcp_bucket_name" {
  description = "The name of the MCP storage bucket"
  value       = google_storage_bucket.mcp_bucket.name
}

output "mcp_bucket_url" {
  description = "The URL of the MCP storage bucket"
  value       = google_storage_bucket.mcp_bucket.url
}

output "mcp_service_account_email" {
  description = "The email of the MCP deploy service account"
  value       = google_service_account.mcp_sa.email
}