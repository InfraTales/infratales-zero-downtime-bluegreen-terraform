#!/bin/bash
set -e

TG_ARN=$1
REGION=${AWS_REGION:-us-east-1}

if [ -z "$TG_ARN" ]; then
  echo "Usage: $0 <target-group-arn>"
  exit 1
fi

echo "Checking health of $TG_ARN..."

# Get healthy host count
HEALTHY_COUNT=$(aws elbv2 describe-target-health \
  --target-group-arn "$TG_ARN" \
  --region "$REGION" \
  --query 'TargetHealthDescriptions[?TargetHealth.State==`healthy`].Target.Id' \
  --output text | wc -w)

if [ "$HEALTHY_COUNT" -gt 0 ]; then
  echo "✅ Health check passed: $HEALTHY_COUNT healthy hosts."
  exit 0
else
  echo "❌ Health check failed: 0 healthy hosts."
  exit 1
fi
