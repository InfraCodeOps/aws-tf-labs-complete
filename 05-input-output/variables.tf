variable "bucket_prefix" {
  description = "Input must be 4-8 characters long and only letters"
  type        = string

  validation {
    condition = length(var.bucket_prefix) >= 4 && length(var.bucket_prefix) <= 8
    error_message = "Input must be 4-8 characters long."
  }

  validation {
    condition     = can(regex("^[a-zA-Z]*$", var.bucket_prefix))
    error_message = "Input must be only letters."
  }
}