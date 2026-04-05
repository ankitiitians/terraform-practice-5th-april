# Key Pair (used to login to EC2 instance via SSH)
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"                 # Name of the key pair in AWS
  public_key = file("terra-key-ec2.pub")      # Public key file from local system
}


# Default VPC (using AWS default VPC instead of creating a new one)
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"                          # Tag for identification
  }
}


# Security Group (controls inbound and outbound traffic for EC2)
resource "aws_security_group" "allow_ssh" {
  name        = "automate-sg"                 # Security group name
  description = "Allow SSH and application access"
  vpc_id      = aws_default_vpc.default.id   # Attach SG to default VPC


  # Inbound rule: Allow SSH access (port 22) from anywhere
  ingress {
    from_port   = 22                         # Starting port
    to_port     = 22                         # Ending port
    protocol    = "tcp"                      # Protocol type
    cidr_blocks = ["0.0.0.0/0"]              # Allow from all IPs (not secure for prod)
    description = "Allow SSH access"
  }


  # Inbound rule: Allow application traffic (port 8000)
  ingress {
    from_port   = 8000                       # Application port start
    to_port     = 8000                       # Application port end
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              # Open to all (can be restricted)
    description = "Allow application traffic"
  }


  # Outbound rule: Allow all traffic to leave EC2
  egress {
    from_port   = 0                          # All ports
    to_port     = 0
    protocol    = "-1"                       # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]              # Allow outbound to anywhere
    description = "Allow all outbound traffic"
  }


  # Tags for better resource management
  tags = {
    Name = "automate-sg"
  }
}

# EC2 Instance (virtual server in the cloud)
resource "aws_instance" "my_ec2" {
  ami           = var.ami_id                      # AMI ID for the EC2 instance (e.g., Amazon Linux 2) - taking from variable
  key_name      = var.key_pair_name # Associate the key pair for SSH access
  security_groups = [aws_security_group.allow_ssh.name] # Attach the security group to the instance 
  instance_type = var.instance_type                # Instance type (small, free tier eligible)


  root_block_device {
    volume_size = var.root_block_device_size                          # Size of the root EBS volume in GB
    volume_type = "gp3"                      # General Purpose SSD
  } 
    tags = {  
    Name = "ankit-automate-ec2"                    # Tag for identification
  }
}