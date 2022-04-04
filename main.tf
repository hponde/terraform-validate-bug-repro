terraform {
  required_version = "1.1.7"
}

module "ci-service-account" {
  source            = "./service-account"

  # Should fail since it's in the past
  # But only fails in `terraform console` not `terraform validate`
  password_expiry = "2020-08-01T20:00:00Z"

  # Should fail since it doesn't parse
  # password_expiry = "aaa"
}