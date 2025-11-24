# Cost Analysis

## Monthly Estimate (US East 1)

| Resource | Configuration | Monthly Cost ($) | Monthly Cost (₹) |
|:---|:---|:---|:---|
| **ALB** | 1 LCU | $22.00 | ₹1,800 |
| **NAT Gateway** | 2 AZs | $64.00 | ₹5,300 |
| **EC2 Instances** | 4x t3.medium | $116.00 | ₹9,600 |
| **EBS Storage** | 4x 20GB gp3 | $8.00 | ₹660 |
| **CloudWatch** | Logs & Alarms | $10.00 | ₹830 |
| **Data Transfer** | 100 GB Out | $9.00 | ₹750 |
| **Total** | | **~$229.00** | **~₹19,000** |

## Optimization Strategies
1. **Spot Instances**: Use Spot instances for the Green environment during testing (save ~70%).
2. **NAT Gateway**: Use a single NAT Gateway for non-prod environments (save $32/mo).
3. **Instance Scheduling**: Scale down to 0 during off-hours for dev/test.

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
