aws_cli_profile = "default"
provider_region = "eu-central-1"

resource_prefix = "testing-chamber-"

vpc_cidr        = "10.0.0.0/16"
vpc_subnet_cidr = "10.0.1.0/24"

sg_ingress_ports = ["22", "80", "443"]
sg_egress_ports  = ["0"]

enable_all_trafic_cidr = "0.0.0.0/0"

ami               = "ami-0e04bcbe83a83792e" #Ubuntu 24.04 LTS 64-bit (x86)
ec2_instance_type = "t2.micro"
ec2_volume_size   = 8
ec2_volume_type   = "gp2"
ec2_key_name      = "testing-chamber-key"
