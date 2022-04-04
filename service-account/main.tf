variable "password_expiry" {
  type        = string
  description = "test"
  validation {
    condition = (tonumber(formatdate("YYYYMMDDhhmmss", var.password_expiry)) >= tonumber(formatdate("YYYYMMDDhhmmss", timeadd(timestamp(), "720h"))))

    error_message = "'password_expiry' must be ISO 8601 datetime and at least one must be valid for the next 30 days."
  }
}
