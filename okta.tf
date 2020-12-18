data "okta_group" "example" {
  name = "EVERYONE"
}

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
  group_whitelist      = [data.okta_group.example.id]
  scope_whitelist = ["*"]
}
resource "okta_auth_server_scope" "example" {
  auth_server_id   = okta_auth_server.example.id
  metadata_publish = "NO_CLIENTS"
  name             = "example"
  consent          = "IMPLICIT"
}

resource "okta_app_saml" "example" {
  label                    = "example"
  sso_url                  = "http://example.com"
  recipient                = "http://example.com"
  destination              = "http://example.com"
  audience                 = "http://example.com/audience"
  subject_name_id_template = "$${user.userName}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  response_signed          = true
  signature_algorithm      = "RSA_SHA256"
  digest_algorithm         = "SHA256"
  honor_force_authn        = false
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
  preconfigured_app        = "okta_org2org"
  auto_submit_toolbar      = false
  features = [
        "IMPORT_PROFILE_UPDATES",
        "PUSH_NEW_USERS",
        "GROUP_PUSH",
        "IMPORT_USER_SCHEMA",
        "IMPORT_NEW_USERS"
    ] 
}
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.0"
    }
  }
}
