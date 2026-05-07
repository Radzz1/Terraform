variable "ec2_instance_type"  {
    type = string
    description = "Type of EC2"
}

variable "ec2_ami" {
    type = string
    description = "AMI for EC2"
}

variable "ec2_storage" {
    type = number
    description = "Storage volume"
}

variable "ec2_vol_type" {
    type = string
    description = "Volume type"
}

variable "env" {
    type = string
    description = "Default Environment"
}