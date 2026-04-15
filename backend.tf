terraform {
  backend "s3" {
    bucket = "young-minds-app-project-terraform-state-123-4507"
    key =  "env/${terraform.workspace}/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
