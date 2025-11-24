#!/bin/bash
set -e

# Usage: ./rollback.sh <listener-arn> <blue-tg-arn> <green-tg-arn>
LISTENER_ARN=$1
BLUE_TG_ARN=$2
GREEN_TG_ARN=$3

if [ -z "$GREEN_TG_ARN" ]; then
  echo "Usage: $0 <listener-arn> <blue-tg-arn> <green-tg-arn>"
  exit 1
fi

echo "🚨 Rolling back to Blue (100%)..."
./swap-traffic.sh "$LISTENER_ARN" "$BLUE_TG_ARN" "$GREEN_TG_ARN" 0
echo "✅ Rollback complete."
