resource "google_storage_bucket" "protected_logging" {
  count = "${local.create_protected_logging_bucket}"

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

  logging {
    log_bucket = "${var.log_bucket}"
  }

  labels = "${var.labels}"

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }

  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }

    condition {
      matches_storage_class = ["REGIONAL"]
      age                   = "${var.move_to_nearline_in}"
    }
  }

  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }

    condition {
      matches_storage_class = ["NEARLINE"]
      age                   = "${var.move_to_coldline_in}"
    }
  }

  lifecycle_rule {
    "action" {
      type = "Delete"
    }

    "condition" {
      age = "${var.delete_after}"
    }
  }
}
