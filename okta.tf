resource "okta_auth_server" "example" {
  audiences   = ["api://example"]
  description = "My Example Auth Server"
  name        = "example"
  issuer_mode = "ORG_URL"
  status      = "ACTIVE"
}
resource "okta_auth_server_claim" "example" {
  auth_server_id = okta_auth_server.example.id
  name           = "staff"
  value          = "String.substringAfter(user.email, \"@\") == \"example.com\""
  claim_type     = "IDENTITY"
}
resource "okta_auth_server_policy" "example" {
  auth_server_id   = okta_auth_server.example.id
  status           = "ACTIVE"
  name             = "example"
  description      = "example"
  priority         = 1
  client_whitelist = ["ALL_CLIENTS"]
}

resource "okta_auth_server_policy_rule" "example" {
  auth_server_id       = okta_auth_server.example.id
  policy_id            = okta_auth_server_policy.example.id
  status               = "ACTIVE"
  name                 = "example"
  priority             = 1  
  grant_type_whitelist = ["implicit"]
  scope_whitelist = "ALL_SCOPES"
}
resource "okta_auth_server_scope" "example" {
  auth_server_id   = okta_auth_server.example.id
  metadata_publish = "NO_CLIENTS"
  name             = "example"
  consent          = "IMPLICIT"
}
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.0"
    }
  }
}
