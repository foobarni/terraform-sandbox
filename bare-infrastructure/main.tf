terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.provider_region
  profile = var.aws_cli_profile
}

# Create a VPC
resource "aws_vpc" "testing_chamber_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.resource_prefix}vpc"
  }
}

# Subnet
resource "aws_subnet" "testing_chamber_subnet" {
  vpc_id     = aws_vpc.testing_chamber_vpc.id
  cidr_block = var.vpc_subnet_cidr

  tags = {
    Name = "${var.resource_prefix}subnet"
  }
}

# Route table
resource "aws_route_table" "testing_chamber_rt" {
  vpc_id = aws_vpc.testing_chamber_vpc.id

  route {
    cidr_block = var.enable_all_trafic_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.resource_prefix}rt"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.testing_chamber_vpc.id
  route_table_id = aws_route_table.testing_chamber_rt.id
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.testing_chamber_vpc.id

  tags = {
    Name = "${var.resource_prefix}igw"
  }
}

# Security group

resource "aws_security_group" "testing_chamber_sg" {
  vpc_id = aws_vpc.testing_chamber_vpc.id
  dynamic "ingress" {
    for_each = var.sg_ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.enable_all_trafic_cidr]
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = [var.enable_all_trafic_cidr]
    }
  }
  tags = {
    Name = "${var.resource_prefix}sg"
  }
}

# EC2 instances
resource "aws_instance" "web" {
  count         = var.ec2_instance_count
  ami           = var.ami
  instance_type = var.ec2_instance_type

  subnet_id                   = aws_subnet.testing_chamber_subnet.id
  vpc_security_group_ids      = [aws_security_group.testing_chamber_sg.id]
  associate_public_ip_address = true
  key_name                    = var.ec2_key_name

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }

  tags = {
    Name = "${var.resource_prefix}ec2"
  }
}
