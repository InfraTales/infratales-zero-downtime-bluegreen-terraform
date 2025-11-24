# Architecture Design: Zero-Downtime Blue/Green

## Overview
This architecture implements a robust Blue/Green deployment strategy using AWS Application Load Balancer (ALB) weighted target groups and Auto Scaling Groups (ASG).

## Key Components

### 1. Traffic Management (ALB)
- **Public ALB**: Handles all incoming traffic.
- **Weighted Listeners**: Distributes traffic between Blue and Green target groups based on a weight (0-100).
- **Health Checks**: Continuously monitors instance health.

### 2. Compute Layer (ASG)
- **Blue ASG**: The currently active production environment.
- **Green ASG**: The new version being deployed and tested.
- **Launch Templates**: Defines instance configuration (AMI, Instance Type, User Data).

### 3. Network Isolation
- **Public Subnets**: Host the ALB and NAT Gateways.
- **Private Subnets**: Host the application instances (ASGs).
- **Security Groups**: Strict ingress/egress rules.

## Traffic Flow
1. User requests hit the ALB.
2. ALB routes request to Blue or Green Target Group based on current weight.
3. Target Group forwards request to healthy instances in the ASG.

## Why Blue/Green?
- **Zero Downtime**: Instant traffic switching.
- **Instant Rollback**: Revert to the previous environment by flipping weights.
- **Testing in Production**: Route 1% of traffic to Green for canary testing.

---
<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a> •
  <a href="https://infratales.com/premium">Premium</a>
</div>
