variable "provider_region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_cli_profile" {
  type    = string
  default = "testing-chamber"
}

variable "resource_prefix" {
  type    = string
  default = "testing-chamber-"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "sg_ingress_ports" {
  type    = list(string)
  default = ["22", "80", "443"]
}

variable "sg_egress_ports" {
  type    = list(string)
  default = ["0"]
}

variable "enable_all_trafic_cidr" {
  default = "0.0.0.0/0"
  type    = string
}

variable "ami" {
  type    = string
  default = "ami-0e04bcbe83a83792e" #Ubuntu 24.04 LTS 64-bit (x86)
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "ec2_volume_size" {
  type    = number
  default = "8"
}

variable "ec2_volume_type" {
  type    = string
  default = "gp2"
}

variable "ec2_key_name" {
  type    = string
  default = "testing-chamber-key"
}
