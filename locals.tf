locals {
  create_default_bucket = ! var.log_bucket
  create_logging_bucket = var.log_bucket

  bucket = local.create_default_bucket ? google_storage_bucket.default : google_storage_bucket.logging
}

