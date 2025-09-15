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

---------------------------------------------------------------------------------------------------------------------------

## How would you let developers deploy their code to the new cluster?
Prefer GitOps with Argo CD:
PR > image build > push to ECR > Argo sync.
 
Direct deploys: limited kubectl/helm roles via RBAC.
Namespace isolation.
 
## Describe how you would manage access for developers to AWS in general and to your new cluster.
Access to an AWS account:
Identity Centre for IAM (SSO)

DeveloperReadOnly (read AWS + kubectl get),
PlatformAdmin (cluster admin).
 
For centralised login, use AWS IAM Identity Centre (Okta).
Azure AD
 
Roles: ReadOnly, NamespaceAdmin, ClusterAdmin.
 
IAM Roles with the least Privileges:
Establish least privilege policies for role-based access (Developer, ReadOnly, Ops, etc.).
 
Federation:
Developers create temporary IAM roles (no permanent credentials) and authenticate using SSO.

## Describe how you would keep the cluster secure and how you would monitor it.
Nodes in private subnets, only ALBs public. Control plane mostly private.
IRSA for AWS access, RBAC for cluster access. Secrets from AWS Secrets Manager.
EBS/S3 encrypted with KMS.
Use NetworkPolicies + Security Groups for isolation.
 
Monitoring:
CloudWatch for control plane + logs,
Prometheus/Grafana for metrics,
GuardDuty/Falco for security alerts.

## Describe how you would route external traffic to the cluster.
ExternalDNS for Route53 records.

Use AWS Load Balancer Controller → ALB for HTTP/S, NLB for TCP.