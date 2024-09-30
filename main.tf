terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "SnowDiscovery"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

variable "SNOWFLAKE_ACCOUNT" {
  description = "The account for Snowflake authentication"
  type        = string
}

variable "SNOWFLAKE_PASSWORD" {
  description = "The password for Snowflake authentication"
  type        = string
}

variable "SNOWFLAKE_USER" {
  description = "The user for Snowflake authentication"
  type        = string
}




provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
