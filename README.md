# Terraform EC2 Provisioning (AWS)

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision an AWS EC2 instance with a security group and SSH access.

It is designed as a beginner-to-intermediate level project with a focus on SRE best practices such as state management, security awareness, and Git hygiene.

---

## Architecture Overview

The following AWS resources are created:

* AWS Key Pair (for SSH access)
* Default VPC (used instead of creating a custom VPC)
* Security Group:

  * SSH access (port 22)
  * Application access (port 8000)
* EC2 Instance (t2.micro)
* Root EBS Volume (8 GB, gp3)

---

## Project Structure

```
terraform-practice-5th-april/
│── ec2.tf               # EC2, Security Group, Key Pair
│── provider.tf          # AWS provider configuration
│── .gitignore           # Ignore sensitive files
│── README.md            # Project documentation
```

---

## Prerequisites

* Terraform installed
* AWS CLI configured (`aws configure`)
* Valid AWS credentials with required permissions

---

## Usage

### Initialize Terraform

```bash
terraform init
```

### Review Execution Plan

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

---

## Security Considerations

* SSH (port 22) is currently open to all (`0.0.0.0/0`)

  * Not recommended for production
* Terraform state files (`.tfstate`) are excluded using `.gitignore`
* Private key files are not committed to GitHub
* Security group rules should be restricted to trusted IPs in real environments

---

## Known Limitations

* Hardcoded AMI ID (region-specific)
* No remote backend (state stored locally)
* No modular structure
* No variable abstraction

---

## Future Improvements

* Use remote backend (AWS S3 + DynamoDB locking)
* Replace hardcoded values with variables
* Implement Terraform modules
* Restrict SSH access to specific IP ranges
* Use dynamic AMI lookup (`data "aws_ami"`)

---

## Learning Outcomes

This project demonstrates:

* Terraform basics (providers, resources, state)
* AWS EC2 provisioning
* Security group configuration
* Git best practices for infrastructure code
* Handling sensitive files using `.gitignore`

---

## Author

Ankit Srivastav

---

## License

This project is for learning and demonstration purposes.
