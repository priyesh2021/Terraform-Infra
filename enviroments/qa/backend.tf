terraform {
    backend "s3" {
        bucket          = "my-demo-terraform-state-v1"
        key             = "qa/terraform.tfstate"
        region          = "ap-south-1"
        dynamodb_table  = "terraform-locks"
        encrypt         = true
    }
}