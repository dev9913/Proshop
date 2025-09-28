terraform {
  backend "s3" {
    bucket         = var.s3bucket
    key            = "global/s3/terraform.tfstate"
    region         = var.region
    #dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}