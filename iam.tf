resource "google_storage_bucket_iam_member" "this" {
  count = "${var.iam_member == "" ? 0 : 1}"

  bucket = "${local.bucket_name}"
  role   = "roles/storage.objectAdmin"
  member = "${var.iam_member}"
}
