locals {
  create_default_bucket = var.log_bucket == "" ? 1 : 0
  create_logging_bucket = 1 - local.create_default_bucket

  bucket_url       = local.create_default_bucket ? google_storage_bucket.default.*.url : google_storage_bucket.logging.*.url
  bucket_name      = local.create_default_bucket ? google_storage_bucket.default.*.name : google_storage_bucket.logging.*.name
  bucket_self_link = local.create_default_bucket ? google_storage_bucket.default.*.self_link : google_storage_bucket.logging.*.self_link
}

