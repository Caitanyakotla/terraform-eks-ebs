Terraform config files

## main.tf
- Creates the VPC (subnets, NAT, routing).
- Creates the EKS cluster + managed node group.
- Sets up OIDC provider for IRSA.
- Creates IAM role for the EBS CSI driver.
- Installs the aws-ebs-csi-driver addon and binds it to that IAM role.

# variables.tf
Defines variables (region, cluster_name, node sizes).

# Providers.tf
kubernetes and helm sync with cluster

# versions.tf
Terraform and provider versions 

# outputs.tf
cluster name, region, endpoint, OIDC provider ARN.