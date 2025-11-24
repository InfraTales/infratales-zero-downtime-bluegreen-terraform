# Failure Mode Analysis

| Failure Scenario | Impact | Mitigation | Recovery |
|:---|:---|:---|:---|
| **AZ Failure** | 50% capacity loss | Multi-AZ ASG | ASG launches new instances in healthy AZs |
| **Bad Deployment** | 5xx errors spike | Blue/Green Strategy | Auto-rollback via CloudWatch Alarm |
| **Instance Crash** | Minimal (1 node) | ALB Health Check | ALB removes unhealthy node, ASG replaces it |
| **Region Failure** | Total outage | Multi-Region DR (Optional) | Failover to DR region (RTO: 1hr) |

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
