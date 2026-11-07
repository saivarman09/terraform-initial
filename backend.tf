terraform {
  backend "s3" {
    bucket       = "sai-s3-backend"
    key          = "ec2-storage/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}