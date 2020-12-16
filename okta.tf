resource "okta_idp_saml_key" "example" {
  x5c = ["MIIChTCCAe4CCQDo0wjPUK8sMDANBgkqhkiG9w0BAQsFADCBhjELMAkGA1UEBhMCVVMxEzARBgNVBAgMCldhc2hpbmd0b24xEjAQBgNVBAcMCVZhbmNvdXZlcjEdMBsGA1UECgwUU3ByaW5nIFNlY3VyaXR5IFNBTUwxDDAKBgNVBAsMA2lkcDEhMB8GA1UEAwwYaWRwLnNwcmluZy5zZWN1cml0eS5zYW1sMB4XDTE4MDUxNDE0NTUyMVoXDTI4MDUxMTE0NTUyMVowgYYxCzAJBgNVBAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRIwEAYDVQQHDAlWYW5jb3V2ZXIxHTAbBgNVBAoMFFNwcmluZyBTZWN1cml0eSBTQU1MMQwwCgYDVQQLDANpZHAxITAfBgNVBAMMGGlkcC5zcHJpbmcuc2VjdXJpdHkuc2FtbDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA2EuygAucRBWtYifgEH/ErVUive4dZdqo72Bze4MbkPuTKLrMCLB6IXxt1p5lu+tr0JxOiRO3KFVOO3D0l+j9zOow4g+JdoMQsjSzA6HtL/D9ZjXP6iUxFCYx+qmnVl3X9ipBD/HVKOBlzIqeXTSa5D17uxPQVxK64UDOI3CyY4cCAwEAATANBgkqhkiG9w0BAQsFAAOBgQAj+6b6dlA6SitTfz44LdnFSW9mYaeimwPP8ZtU7/3EJCzLd5eq7N/0kYPNVclZvB45I0UMT77AHWrNyScm56MTcEpSuHhJHAqRAgJKbciCTNsFI928EqiWSmu//w0ASBN3bVa8nv8/rafuutCq3RskTkHVZnbT5Xa6ITEZxSncow=="]
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
