terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws         = { source = "hashicorp/aws",        version = ">= 6.0" }
    kubernetes  = { source = "hashicorp/kubernetes", version = ">= 2.35" }
    helm        = { source = "hashicorp/helm",       version = ">= 2.12" }
    http        = { source = "hashicorp/http",       version = "~> 3.4" }
  }
}
