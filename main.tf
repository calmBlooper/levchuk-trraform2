terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "Voldemar"
  vpc_security_group_ids = ["sg-0ba527b205aa160b5"]

  tags = {
    Name = "VoldemarInstanceV2"
  }
}

