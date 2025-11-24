# Scaling Strategy

## Auto Scaling Configuration
- **Metric**: Average CPU Utilization.
- **Target Value**: 60%.
- **Scale Out Cooldown**: 300 seconds.
- **Scale In Cooldown**: 300 seconds.

## Capacity Planning
| Environment | Min | Max | Desired | Instance Type |
|:---|:---|:---|:---|:---|
| **Dev** | 1 | 2 | 1 | t3.micro |
| **Staging** | 2 | 4 | 2 | t3.small |
| **Prod** | 4 | 10 | 4 | t3.medium |

## Predictive Scaling
For predictable traffic patterns (e.g., 9 AM login spike), we use **Scheduled Actions**:
- **Scale Out**: 8:30 AM (Min: 6)
- **Scale In**: 8:00 PM (Min: 2)

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
