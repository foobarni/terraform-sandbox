# Terraform EC2 Infrastructure Provisioning

This Terraform configuration provisions a basic EC2 infrastructure on AWS. It sets up the necessary networking components, including:

    - A Virtual Private Cloud (VPC)
    - A Subnet
    - A Route Table and Internet Gateway
    - Security Group with custom ingress/egress rules
    - EC2 instances

You can specify the number of EC2 instances to launch, with a default of 1 instance if no count is provided.

## Usage

To customize this configuration, you can modify the variables in the `template.tfvars` file. This file serves as an example of the expected inputs when applying the configuration.