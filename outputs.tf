output "depended_on" {
  description = "A list of dependencies for a dependency chain"
  value       = "${null_resource.dependency_setter.id}"
}

output "name" {
  description = "The name of the created bucket"
  value       = "${google_storage_bucket.this.name}"
}
