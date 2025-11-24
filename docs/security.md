# Security Model

## Network Security
- **VPC Isolation**: Application instances reside in private subnets with no public IP addresses.
- **NAT Gateway**: Outbound internet access for patching/updates via NAT.
- **Security Groups**:
  - **ALB SG**: Allows Inbound 80/443 from 0.0.0.0/0.
  - **App SG**: Allows Inbound 8080 only from ALB SG.

## Data Protection
- **Encryption at Rest**: All EBS volumes are encrypted using AWS KMS.
- **Encryption in Transit**: TLS termination at the ALB.

## IAM & Access Control
- **Least Privilege**: Instance profiles have minimal permissions (S3 read, CloudWatch write).
- **No SSH**: SSH access is disabled. AWS Systems Manager Session Manager is used for debugging.

## Vulnerability Management
- **AMI Hardening**: Use latest Amazon Linux 2023 AMIs.
- **Inspector**: Automated vulnerability scanning enabled.

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
