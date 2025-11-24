#!/bin/bash
echo "Checking prerequisites..."
if ! command -v terraform &> /dev/null; then
    echo "Terraform not found!"
    exit 1
fi
echo "Ready to deploy."
