#Key-Pair
resource "aws_key_pair" "my_key" {
  key_name= "terra-key"
  public_key = file("terra-key.pub")
}

#VPC
resource "aws_default_vpc" "default" {

}

#Security Group
resource "aws_security_group" "my_sg" {
    name = "terra-sg"
    description = "Creating through Terraform"
    vpc_id = aws_default_vpc.default.id

    #inbound rules
    ingress {
        from_port =22
        to_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH Traffic"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP traffic"
    }

    #Outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "terra-sg"
    }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    count = var.ec2_count
    user_data = file("nginx.sh")

    root_block_device {
        volume_size = var.ec2_storage
        volume_type = var.ec2_vol_type
    }

    tags = {
      Name = "Terra-Instance"
    }
}