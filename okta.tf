resource "okta_idp_saml_key" "example" {
  x5c = ["${certificate}"]
}
resource "okta_idp_saml" "example" {
  name                     = "testAcc_replace_with_uuid"
  acs_binding              = "HTTP-POST"
  acs_type                 = "INSTANCE"
  sso_url                  = "https://idp.example.com"
  sso_destination          = "https://idp.example.com"
  sso_binding              = "HTTP-POST"
  username_template        = "idpuser.email"
  kid                      = "${okta_idp_saml_key.example.id}"
  issuer                   = "https://idp.example.com"
  request_signature_scope  = "REQUEST"
  response_signature_scope = "ANY"
}
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.0"
    }
  }
}
