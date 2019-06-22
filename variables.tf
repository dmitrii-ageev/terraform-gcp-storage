variable "name" {
  description = "The name of a bucket"
  type        = string
}

variable "project" {
  description = "The name of a project"
  type        = string
}

variable "labels" {
  description = "Labels to set for the bucket"
  type        = map(string)
  default     = {}
}

variable "iam_owner" {
  description = "Service account that owns the bucket"
  type        = string
  default     = ""
}

variable "iam_member" {
  description = "Provide Admin access to this IAM member"
  default     = ""
}

variable "location" {
  description = "The location where a bucket will be created."
  default     = "us-central1"
}

variable "storage_class" {
  description = "Default storage class"
  default     = "MULTI_REGIONAL"
}

variable "versioning" {
  description = "Whether enable versioning or not"
  default     = false
}

variable "encryption_key" {
  description = "The name of the encryption key to use"
  default     = ""
}

variable "log_bucket" {
  description = "If set, all actions will be logged to the specified bucket"
  default     = ""
}

variable "move_to_nearline_in" {
  description = "The number of days to keep files before moving them to NearLine"
  default     = 180
}

variable "move_to_coldline_in" {
  description = "The number of days to keep files before moving them to ColdLine"
  default     = 365
}

variable "delete_after" {
  description = "The number of days after which files to be deleted"
  default     = 730
}

