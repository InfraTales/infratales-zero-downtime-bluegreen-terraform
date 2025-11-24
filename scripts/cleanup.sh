#!/bin/bash
echo "Cleaning up..."
rm -rf ../terraform/.terraform
rm -f ../terraform/*.tfstate*
echo "Cleanup complete."
