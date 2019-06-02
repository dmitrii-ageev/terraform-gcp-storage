variable "dependencies" {
  description = "A list of resources this module depends on"
  type        = "list"
  default     = []
}

variable "name" {
  description = "The name of a bucket"
  type        = "string"
}

variable "project" {
  description = "The name of a project"
  type        = "string"
}

variable "labels" {
  description = "Labels to set for the bucket"
  type        = "map"
  default     = {}
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
  description = "Whether to enable versioning or not"
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
