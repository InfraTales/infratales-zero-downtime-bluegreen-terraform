#!/bin/bash
echo "Validating Terraform..."
cd ../terraform
terraform validate
echo "Validation complete."
