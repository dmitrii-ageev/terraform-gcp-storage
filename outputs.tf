output "name" {
  description = "The name of the created bucket"
  value       = "${google_storage_bucket.this.name}"
}

output "self_link" {
  value       = "${google_storage_bucket.this.self_link}"
  description = "The URI of the created resource."
}

output "url" {
  value       = "${google_storage_bucket.this.url}"
  description = "The base URL of the bucket, in the format gs://<bucket-name>."
}
