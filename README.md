# InfraTales | Zero-Downtime Deployments – Blue/Green on AWS (Terraform)

**A production-grade Blue/Green deployment system on AWS using Terraform, ALB weighted routing, Auto Scaling, CloudWatch Alarms, and seamless rollback automation.**

![Architecture Diagram](diagrams/architecture.mmd)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.5+-purple.svg)](https://terraform.io)
[![AWS](https://img.shields.io/badge/AWS-Production-orange.svg)](https://aws.amazon.com)

## 🚀 Features

- **Zero-Downtime Deployments**: Seamless traffic shifting using ALB weighted target groups.
- **Automated Rollbacks**: CloudWatch alarms trigger instant rollback on 5xx errors or latency spikes.
- **Immutable Infrastructure**: Fresh Auto Scaling Groups for every deployment (Blue/Green).
- **Secure by Design**: Private subnets, encrypted volumes, least privilege IAM, security groups.
- **Cost Optimized**: NAT Gateway sharing, spot instance support, auto-scaling policies.
- **Observability**: Pre-configured CloudWatch dashboards, alarms, and log groups.

## 🏗️ Architecture

This project deploys a complete Blue/Green architecture:
1. **ALB Layer**: Public Application Load Balancer with weighted listeners.
2. **Compute Layer**: Two Auto Scaling Groups (Blue & Green) in private subnets.
3. **Data Layer**: Encrypted S3 buckets and DynamoDB tables (optional state).
4. **Network Layer**: VPC with public/private isolation, NAT Gateway, and VPC Endpoints.

## 🛠️ Quick Start

### Prerequisites
- Terraform v1.5+
- AWS CLI v2
- jq

### Deploy
```bash
# 1. Initialize
cd terraform
terraform init

# 2. Plan
terraform plan -var-file="prod.tfvars"

# 3. Apply (Blue Environment)
terraform apply -var-file="prod.tfvars"
```

### Blue/Green Swap
```bash
# Shift 10% traffic to Green
./scripts/swap-traffic.sh --weight 10

# Shift 100% traffic to Green
./scripts/swap-traffic.sh --weight 100
```

## 💰 Cost Estimation

| Resource | Type | Monthly Cost (Est.) | Note |
|:---|:---|:---|:---|
| **ALB** | Application LB | $16.00 / ₹1,300 | Base price + LCU |
| **NAT Gateway** | Managed NAT | $32.00 / ₹2,600 | 1 per AZ (optimizable) |
| **EC2** | t3.medium | $29.00 / ₹2,400 | Per instance (spot cheaper) |
| **CloudWatch** | Metrics/Logs | $5.00 / ₹400 | Alarms & Dashboard |
| **Total** | | **~$82.00 / ₹6,700** | *Varies by traffic* |

## 🛡️ Security

- **Encryption**: KMS used for EBS, S3, and RDS.
- **Network**: No public SSH access. Session Manager enabled.
- **IAM**: Granular permissions for ASG and CodeDeploy.

## 👤 Author

**Rahul Ladumor** - Founder of InfraTales

- 🌐 Portfolio: [rahulladumor.in](https://www.rahulladumor.in)
- ☁️ Blog: [acloudwithrahul.in](https://www.acloudwithrahul.in)
- 💼 GitHub: [@rahulladumor](https://github.com/rahulladumor)
- 🏢 Organization: [InfraTales](https://github.com/InfraTales)
- 📧 Email: rahul.ladumor@infratales.com
- 💬 LinkedIn: [linkedin.com/in/rahulladumor](https://www.linkedin.com/in/rahulladumor)

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

<div align="center">

**Built with ❤️ by [InfraTales](https://github.com/InfraTales)**

<a href="https://infratales.com">Website</a> •
<a href="https://infratales.com/projects">Projects</a> •
<a href="https://infratales.com/premium">Premium</a> •
<a href="https://infratales.com/newsletter">Newsletter</a>

</div>
