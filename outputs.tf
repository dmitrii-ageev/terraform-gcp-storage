output "name" {
  description = "A name of the created bucket resource"
  value       = google_storage_bucket.this.name
}

output "self_link" {
  description = "A self link to the created bucket resource"
  value       = google_storage_bucket.this.self_link
}

output "url" {
  description = "A URL of the created bucket resource"
  value       = google_storage_bucket.this.url
}
