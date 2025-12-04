#!/bin/bash
set -e

cd "$(dirname "$0")/../terraform"
ALB=$(terraform output -raw alb_dns)

echo "Testing ALB at: http://$ALB/"
curl http://$ALB/
curl http://$ALB/health
