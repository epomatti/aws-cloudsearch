provider "aws" {
  region = var.region
}

variable "region" {
  type = string
}

resource "aws_cloudsearch_domain" "movies" {
  name = "movies-domain"

  scaling_parameters {
    desired_instance_type     = "search.small"
    desired_replication_count = 1
  }

  # index_field {
  #   name            = "headline"
  #   type            = "text"
  #   search          = true
  #   return          = true
  #   sort            = true
  #   highlight       = false
  #   analysis_scheme = "_en_default_"
  # }

  # index_field {
  #   name   = "price"
  #   type   = "double"
  #   search = true
  #   facet  = true
  #   return = true
  #   sort   = true

  #   source_fields = "headline"
  # }
}

resource "aws_cloudsearch_domain_service_access_policy" "movies" {
  domain_name   = aws_cloudsearch_domain.movies.id
  access_policy = file("${path.module}/cloudsearch-policy.json")
}
