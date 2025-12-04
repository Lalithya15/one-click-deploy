
# One-Click Deployment Assignment

## Overview
This project demonstrates a **one-click deployment** of a simple REST API running on private EC2 instances behind an **Application Load Balancer (ALB)** and **Auto Scaling Group (ASG)** using **Terraform**.

## Project Structure

```

one-click-deploy/
├─ terraform/        # Infrastructure as Code
├─ app/              # Node.js REST API
├─ scripts/          # Deployment, destroy, test scripts
└─ README.md

````

## Deployment

1. Navigate to terraform folder:
```bash
cd terraform
terraform init
terraform apply -auto-approve
````

2. Or use deploy script:

```bash
cd scripts
bash deploy.sh
```

## Testing

1. Get the ALB DNS:

```bash
cd terraform
terraform output -raw alb_dns
```

2. Test API:

```bash
cd scripts
bash test.sh
```

Expected responses:

```
GET /        -> Hello from private EC2 behind the ALB!
GET /health  -> ok
```

## Teardown

```bash
cd scripts
bash destroy.sh
```

Or with Terraform:

```bash
cd terraform
terraform destroy -auto-approve
```

## Notes

* EC2 instances are private, access internet via NAT Gateway.
* Security Groups:

  * ALB SG allows HTTP/HTTPS from internet.
  * EC2 SG allows traffic only from ALB.
* IAM Role attached for CloudWatch and SSM.
* Logs printed to stdout.
* No hardcoded secrets.

## Screenshots (Placeholders)

* ALB in AWS Console
* Target Group with healthy instances
* API response using curl
* Private EC2 instances without public IPs


