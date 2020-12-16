resource "okta_user" "example" {  
  email ="terreform@example.com"
  login = "terreform@example.com"
  first_name = "terraform"
  last_name = "example"
}

resource "okta_user" "example1" {  
  email ="terreform@example1.com"
  login = "terreform@example1.com"
  first_name = "terraform1"
  last_name = "example1"
}

terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "3.7.0"
    }
  }
}
