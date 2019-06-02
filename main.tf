resource "google_storage_bucket" "this" {
  depends_on = ["null_resource.dependency_getter"]

  name          = "${var.name}"
  project       = "${var.project}"
  location      = "${var.location}"
  storage_class = "${var.storage_class}"

  encryption {
    default_kms_key_name = "${var.encryption_key}"
  }

  versioning {
    enabled = "${var.versioning}"
  }

  labels = "${var.labels}"

  logging {
    log_bucket = "${var.log_bucket}"
  }

  lifecycle {
    create_before_destroy = true
  }

  lifecycle_rule {
    "action" {
      type = "Delete"
    }

    "condition" {
      age = 90
    }
  }

  lifecycle_rule {
    "action" {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }

    "condition" {
      age = 180

      matches_storage_class = ["MULTI_REGIONAL"]
    }
  }

  lifecycle_rule {
    "action" {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }

    "condition" {
      age                   = 730
      matches_storage_class = ["NEARLINE"]
    }
  }
}
