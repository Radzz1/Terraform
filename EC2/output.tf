output "ec2_public_ip" {
    value = aws_instance.my_instance[1].public_ip
    description = "Public IP of an instance"
}