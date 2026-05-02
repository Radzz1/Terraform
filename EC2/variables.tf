variable "ec2_instance_type"  {
    default = "t2.micro"
    type = string
    description = "Type of EC2"
}

variable "ec2_ami" {
    default = "ami-0a59248a6294cece2"
    type = string
    description = "AMI for EC2"
}

variable "ec2_storage" {
    default = 15
    type = number
    description = "Storage volume"
}

variable "ec2_vol_type" {
    default = "gp3"
    type = string
    description = "Volume type"
}

variable "count" {
    default = 3
    type = number
    description = "Number of EC2 instances"
}