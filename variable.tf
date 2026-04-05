variable    "instance_type" {
  description = "Type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "root_block_device_size" {
  description = "Size of the root block device in GB"
  type        = number
  default     = 13
}
variable "key_pair_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
  default     = "terra-key-ec2"
}
variable "public_key_path" {
  description = "Path to the public key file for the AWS key pair"
  type        = string
  default     = "terra-key-ec2.pub"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-07062e2a343acc423"
}


