provider "aws" {
  region = var.region
}

variable "region" {
  type = string
}

resource "aws_cloudsearch_domain" "movies" {
  name = "movies-domain"

  timeouts {
    create = "1h"
    update = "1h"
    delete = "1h"
  }

  scaling_parameters {
    desired_instance_type     = "search.small"
    desired_replication_count = 1
  }

  index_field {
    name            = "title"
    type            = "text"
    search          = true
    return          = true
    sort            = false
    highlight       = false
    analysis_scheme = "_en_default_"
  }

  index_field {
    name            = "directors"
    type            = "text-array"
    search          = true
    return          = true
    sort            = false
    highlight       = false
    analysis_scheme = "_en_default_"
  }

  index_field {
    name            = "genres"
    type            = "text-array"
    search          = true
    return          = true
    sort            = false
    highlight       = false
    analysis_scheme = "_en_default_"
  }

  index_field {
    name            = "actors"
    type            = "text-array"
    search          = true
    return          = true
    sort            = false
    highlight       = false
    analysis_scheme = "_en_default_"
  }
}

resource "aws_cloudsearch_domain_service_access_policy" "movies" {
  domain_name   = aws_cloudsearch_domain.movies.id
  access_policy = file("${path.module}/cloudsearch-policy.json")

  timeouts {
    update = "1h"
    delete = "1h"
  }
}

output "search_endpoint" {
  value = aws_cloudsearch_domain.movies.search_service_endpoint
}

output "document_endpoint" {
  value = aws_cloudsearch_domain.movies.document_service_endpoint
}
