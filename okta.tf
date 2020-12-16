resource "okta_user" "example" {  
  email ="terreform@example.com"
  login = "terreform@example.com"
  first_name = "terraform"
  last_name = "example"
}

terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.0"
    }
  }
}
