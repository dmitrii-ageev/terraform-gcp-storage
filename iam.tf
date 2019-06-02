resource "google_storage_bucket_iam_member" "this" {
  count = "${var.iam_member == "" ? 0 : 1}"

  depends_on = ["google_storage_bucket.this"]

  bucket = "${google_storage_bucket.this.name}"
  role   = "roles/storage.objectAdmin"
  member = "${var.iam_member}"
}
