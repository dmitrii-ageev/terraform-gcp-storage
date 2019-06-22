output "url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>."
  value       = local.bucket_url
}

output "name" {
  description = "The name of the created bucket"
  value       = local.bucket_name
}

output "self_link" {
  description = "The URI of the created resource."
  value       = local.bucket_self_link
}

