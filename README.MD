````markdown
# Bastion Host Setup with Terraform

This project provisions an AWS EC2 instance (bastion host) using Terraform. The bastion host will be configured with a custom security group, a key pair, and will have SSH access configured from allowed CIDR blocks. The setup also outputs the SSH command to access the bastion host and the public IP of the instance.

## Prerequisites

Before you begin, ensure the following prerequisites are met:

- Terraform
- AWS CLI configured with appropriate credentials
- SSH client installed for connecting to the bastion host

## Files in this Project

- **main.tf**: Contains the Terraform configuration for provisioning resources.
- **my-key**: RSA key pair file used for accessing the bastion host.

## Terraform Configuration Overview

### Key Pair Generation

To generate a new SSH key pair for accessing the bastion host, run the following command:

```bash
ssh-keygen -t rsa -b 4096 -f my-key
```
````

This will create the private key `my-key` and public key `my-key.pub`.

### Variables

The following variables can be customized:

- `region`: AWS region to deploy resources (default is `us-east-1`).
- `key_name`: Name of the key pair to create (default is `bastion-key`).
- `allowed_cidr_blocks`: List of CIDR blocks allowed to access the bastion host via SSH (default is `["0.0.0.0/0"]`).
- `instance_type`: Type of EC2 instance to deploy (default is `t2.micro`).

### Outputs

- `bastion_public_ip`: Public IP address of the bastion host.
- `ssh_command`: SSH command to connect to the bastion host.

## How to Deploy

1. Clone this repository or copy the Terraform files to your project directory.

2. Initialize the Terraform project:

   ```bash
   terraform init
   ```

3. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

   This will prompt you for approval. Type `yes` to confirm the deployment.

4. After the deployment is complete, Terraform will output the bastion host's public IP address and the SSH command to access it.

5. Use the provided SSH command to connect to the bastion host:

   ```bash
   ssh -i my-key ec2-user@<bastion_public_ip>
   ```

## Cleanup

To destroy the resources created by Terraform, run the following command:

```bash
terraform destroy
```

This will terminate the EC2 instance and remove the security group and key pair.
