locals {
  create_logging_bucket = "${var.log_bucket == "" ? 0 : 1}"
  create_default_bucket = "${1 - local.create_logging_bucket}"

  bucket_url = "${join("", concat(
                                     google_storage_bucket.default.*.url,
                                     google_storage_bucket.logging.*.url) )}"

  bucket_name = "${join("", concat(
                                     google_storage_bucket.default.*.name,
                                     google_storage_bucket.logging.*.name) )}"

  bucket_self_link = "${join("", concat(
                                     google_storage_bucket.default.*.self_link,
                                     google_storage_bucket.logging.*.self_link) )}"

  iam_owner = "${var.iam_owner == "" ? data.google_client_openid_userinfo.owner.email : var.iam_owner}"
}
