#!/bin/bash
set -e

# Usage: ./swap-traffic.sh <listener-arn> <blue-tg-arn> <green-tg-arn> <green-weight>
LISTENER_ARN=$1
BLUE_TG_ARN=$2
GREEN_TG_ARN=$3
GREEN_WEIGHT=$4
REGION=${AWS_REGION:-us-east-1}

if [ -z "$GREEN_WEIGHT" ]; then
  echo "Usage: $0 <listener-arn> <blue-tg-arn> <green-tg-arn> <green-weight>"
  exit 1
fi

BLUE_WEIGHT=$((100 - GREEN_WEIGHT))

echo "⚖️  Shifting traffic: Blue=${BLUE_WEIGHT}% | Green=${GREEN_WEIGHT}%"

aws elbv2 modify-listener \
  --listener-arn "$LISTENER_ARN" \
  --region "$REGION" \
  --default-actions \
  "Type=forward,ForwardConfig={TargetGroups=[{TargetGroupArn=$BLUE_TG_ARN,Weight=$BLUE_WEIGHT},{TargetGroupArn=$GREEN_TG_ARN,Weight=$GREEN_WEIGHT}]}" \
  > /dev/null

echo "✅ Traffic shift complete."
