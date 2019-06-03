locals {
  enable_logging_bucket           = "${var.log_bucket == "" ? 0 : 1}"
  enable_default_bucket           = "${1 - local.create_logging_bucket}"
  create_default_bucket           = "${var.prevent_destroy ? 0 : local.enable_default_bucket}"
  create_logging_bucket           = "${var.prevent_destroy ? 0 : local.enable_logging_bucket}"
  create_protected_default_bucket = "${var.prevent_destroy ? local.enable_default_bucket : 0}"
  create_protected_logging_bucket = "${var.prevent_destroy ? local.enable_logging_bucket : 0}"

  bucket_url = "${join("", concat(
                                     google_storage_bucket.default.*.url,
                                     google_storage_bucket.logging.*.url,
                                     google_storage_bucket.protected_default.*.url,
                                     google_storage_bucket.protected_logging.*.url) )}"

  bucket_name = "${join("", concat(
                                     google_storage_bucket.default.*.name,
                                     google_storage_bucket.logging.*.name,
                                     google_storage_bucket.protected_default.*.name,
                                     google_storage_bucket.protected_logging.*.name) )}"

  bucket_self_link = "${join("", concat(
                                     google_storage_bucket.default.*.self_link,
                                     google_storage_bucket.logging.*.self_link,
                                     google_storage_bucket.protected_default.*.self_link,
                                     google_storage_bucket.protected_logging.*.self_link) )}"
}
