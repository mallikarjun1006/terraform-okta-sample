resource "okta_user" "example" {
  index       = "customPropertyName"
  title       = "customPropertyName"
  type        = "string"
  description = "My custom property name"
  master      = "OKTA"
  scope       = "SELF"
  email ="terreform@example.com"
  login = "terreform@example.com"
  first_name = "terraform"
  last_name = "example"
}