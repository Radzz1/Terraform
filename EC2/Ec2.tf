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
    count = 3
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    ami = "ami-0a59248a6294cece2"
    instance_type = "t2.micro"

    root_block_device {
        volume_size = 10
        volume_type = "gp3"
    }

    tags = {
      Name = "Terra-Instance"
    }
}