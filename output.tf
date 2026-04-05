output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip      # Output the public IP of the EC2 instance
  description = "Public IP address of the EC2 instance"
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2.id             # Output the ID of the EC2 instance
  description = "ID of the EC2 instance"
}

output "ec2_instance_type" {
  value = aws_instance.my_ec2.instance_type   # Output the instance type of the EC2 instance
  description = "Instance type of the EC2 instance"
}

output "ec2_private_ip" {
  value = aws_instance.my_ec2.private_ip     # Output the private IP of the EC2 instance
  description = "Private IP address of the EC2 instance"
}
