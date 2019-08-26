resource "google_storage_bucket" "this" {
  name          = var.name
  project       = var.project
  location      = var.location
  storage_class = var.storage_class
  labels        = var.labels

  encryption {
    default_kms_key_name = var.encryption_key
  }
  versioning {
    enabled = var.versioning
  }
  dynamic "logging" {
    for_each = var.log_buckets
    content {
      log_bucket        = logging.value
      log_object_prefix = var.name
    }
  }
  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition {
      matches_storage_class = ["REGIONAL"]
      age                   = var.move_to_nearline_in
    }
  }
  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      matches_storage_class = ["NEARLINE"]
      age                   = var.move_to_coldline_in
    }
  }
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.delete_after
    }
  }
}

