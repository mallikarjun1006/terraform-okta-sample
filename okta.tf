resource "okta_idp_saml_key" "example" {
  x5c = ["-----BEGIN CERTIFICATE-----
MIIChTCCAe4CCQDo0wjPUK8sMDANBgkqhkiG9w0BAQsFADCBhjELMAkGA1UEBhMC
VVMxEzARBgNVBAgMCldhc2hpbmd0b24xEjAQBgNVBAcMCVZhbmNvdXZlcjEdMBsG
A1UECgwUU3ByaW5nIFNlY3VyaXR5IFNBTUwxDDAKBgNVBAsMA2lkcDEhMB8GA1UE
AwwYaWRwLnNwcmluZy5zZWN1cml0eS5zYW1sMB4XDTE4MDUxNDE0NTUyMVoXDTI4
MDUxMTE0NTUyMVowgYYxCzAJBgNVBAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9u
MRIwEAYDVQQHDAlWYW5jb3V2ZXIxHTAbBgNVBAoMFFNwcmluZyBTZWN1cml0eSBT
QU1MMQwwCgYDVQQLDANpZHAxITAfBgNVBAMMGGlkcC5zcHJpbmcuc2VjdXJpdHku
c2FtbDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA2EuygAucRBWtYifgEH/E
rVUive4dZdqo72Bze4MbkPuTKLrMCLB6IXxt1p5lu+tr0JxOiRO3KFVOO3D0l+j9
zOow4g+JdoMQsjSzA6HtL/D9ZjXP6iUxFCYx+qmnVl3X9ipBD/HVKOBlzIqeXTSa
5D17uxPQVxK64UDOI3CyY4cCAwEAATANBgkqhkiG9w0BAQsFAAOBgQAj+6b6dlA6
SitTfz44LdnFSW9mYaeimwPP8ZtU7/3EJCzLd5eq7N/0kYPNVclZvB45I0UMT77A
HWrNyScm56MTcEpSuHhJHAqRAgJKbciCTNsFI928EqiWSmu//w0ASBN3bVa8nv8/
rafuutCq3RskTkHVZnbT5Xa6ITEZxSncow==
-----END CERTIFICATE-----"]
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
