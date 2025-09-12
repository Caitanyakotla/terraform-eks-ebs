variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "demo-eks-ebs"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of AZs/subnets to use"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "Instance types for the node group"
  type        = list(string)
  default     = ["t3.large"]
}

variable "desired_size" {
  description = "Desired size of managed node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Max size of managed node group"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "Min size of managed node group"
  type        = number
  default     = 1
}
