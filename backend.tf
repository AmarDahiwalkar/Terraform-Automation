terraform {
  backend "s3" {
    bucket = "young-minds-app-project-terraform-state-123-4507"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
