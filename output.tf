# EC2 Public IP
output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_eip.myFirstInstance.public_ip
}

# EC2 Instance ID
output "ec2_instance_id" {
  description = "Instance ID of EC2"
  value       = aws_instance.myFirstInstance.id
}

# EC2 Public DNS
output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.myFirstInstance.public_dns
}

# VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# Security Group ID
output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.jenkins-sg-2022.id
}

# S3 Bucket Name
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.my-s3-bucket.bucket
}