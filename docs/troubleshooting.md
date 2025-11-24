# Troubleshooting Guide

| Symptom | Probable Cause | Fix |
|:---|:---|:---|
| **502 Bad Gateway** | App not running on port 8080 | Check UserData logs: `/var/log/cloud-init-output.log` |
| **Health Check Fails** | Security Group blocking ALB | Allow Inbound 8080 from ALB SG in App SG |
| **Instance Not Launching** | IAM Profile missing | Verify Instance Profile exists and is attached |
| **Traffic Not Shifting** | Listener Rule priority | Check `aws elbv2 describe-rules` for conflicts |
| **High Latency** | CPU Saturation | Check CloudWatch CPU metrics, scale out ASG |

## Log Locations
- **Application Logs**: `/var/log/app/application.log`
- **Startup Logs**: `/var/log/cloud-init-output.log`
- **Agent Logs**: `/var/log/amazon/ssm/amazon-ssm-agent.log`

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
