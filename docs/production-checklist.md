# Production Readiness Checklist

## Security
- [ ] **KMS Encryption**: Verified all EBS volumes are encrypted.
- [ ] **Security Groups**: Verified no 0.0.0.0/0 on port 22.
- [ ] **IAM Roles**: Verified least privilege for App Instance Profile.
- [ ] **Secrets**: No hardcoded secrets in UserData or Terraform.

## Reliability
- [ ] **Multi-AZ**: ASG spans at least 2 Availability Zones.
- [ ] **Health Checks**: ALB health check path `/health` returns 200 OK.
- [ ] **Auto Scaling**: Scaling policies configured for CPU > 60%.

## Observability
- [ ] **Logs**: Application logs shipping to CloudWatch Logs.
- [ ] **Alarms**: 5xx Error Rate alarm active.
- [ ] **Dashboard**: Main dashboard created and visible.

## Operations
- [ ] **Tags**: All resources tagged with `Environment`, `Project`, `Owner`.
- [ ] **Backup**: RDS automated backups enabled (if applicable).
- [ ] **Runbook**: Rollback procedure tested in Staging.

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
