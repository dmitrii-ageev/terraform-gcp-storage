// Reset existing bucket permissions
resource "google_storage_bucket_iam_binding" "this" {
  count   = var.iam_owner == "" ? 0 : 1
  bucket  = local.bucket.name
  role    = "roles/storage.legacyBucketOwner"
  members = [var.iam_owner]
}

// Grant the storage admin role for the iam_member
resource "google_storage_bucket_iam_member" "this" {
  count      = var.iam_member == "" ? 0 : 1
  depends_on = [google_storage_bucket_iam_binding.this]

  bucket = local.bucket.name
  role   = "roles/storage.objectAdmin"
  member = var.iam_member
}

