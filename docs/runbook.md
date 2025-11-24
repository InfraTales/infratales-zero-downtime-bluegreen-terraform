# Operational Runbook

## Deployment Procedure
1. **Provision Green**: Apply Terraform to create the Green ASG.
   ```bash
   terraform apply -var="green_capacity=2"
   ```
2. **Health Check**: Verify Green instances are healthy.
   ```bash
   ./scripts/healthcheck.sh --target-group green
   ```
3. **Shift Traffic**: Gradually shift traffic.
   ```bash
   ./scripts/swap-traffic.sh --weight 10
   # Monitor for 5 mins
   ./scripts/swap-traffic.sh --weight 50
   # Monitor for 5 mins
   ./scripts/swap-traffic.sh --weight 100
   ```
4. **Decommission Blue**: Scale down Blue ASG.
   ```bash
   terraform apply -var="blue_capacity=0"
   ```

## Rollback Procedure
If 5xx errors spike > 1%:
1. **Immediate Revert**:
   ```bash
   ./scripts/rollback.sh
   ```
2. **Verify**: Check ALB metrics to ensure traffic is back to Blue.
3. **Investigate**: Analyze Green instance logs.

## Monitoring Checks
- **ALB Latency**: Should be < 100ms.
- **HTTP 5xx**: Should be 0.
- **CPU Utilization**: Should be < 60%.

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
