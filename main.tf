terraform {
  required_version = ">= 1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "anish" {
  instance_type = "t3.micro"
  ami           = "ami-020ba0ae8c230ae28"
  subnet_id     = "subnet-02801f8bef9890b49"
}

resource "aws_instance" "web_server" {
  instance_type = "t3.micro"
  ami           = "ami-020ba0ae8c230ae28"
  subnet_id     = "subnet-02801f8bef9890b49"

  tags = {
    Name        = "web-server"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sai-s3-backend"
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}