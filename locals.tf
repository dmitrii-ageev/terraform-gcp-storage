locals {
  logging_disabled = {}

  logging_enabled = {
    log_bucket = "${var.log_bucket}"
  }
}
