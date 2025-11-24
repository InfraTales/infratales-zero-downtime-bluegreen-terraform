# Observability Stack

## Metrics (CloudWatch)
- **Application**: Request Count, Latency, Error Rate.
- **Infrastructure**: CPU, Memory, Disk I/O.
- **ALB**: Target Response Time, 5xx Count, 4xx Count.

## Logs (CloudWatch Logs)
- **Log Group**: `/aws/ec2/app-logs`
- **Retention**: 30 Days.
- **Filters**: Error patterns (`ERROR`, `Exception`, `Fatal`).

## Alarms
| Alarm Name | Threshold | Action |
|:---|:---|:---|
| **HighErrorRate** | 5xx > 1% for 5 mins | SNS Alert + Auto Rollback |
| **HighLatency** | p95 > 500ms for 5 mins | SNS Alert |
| **HighCPU** | CPU > 80% for 5 mins | Scale Out |

## Dashboards
- **Main Dashboard**: `App-Overview`
  - Traffic Overview
  - Error Rates
  - Infrastructure Health

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
