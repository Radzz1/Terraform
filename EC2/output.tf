/*output "ec2_public_ip" {
    value = aws_instance.my_instance[*].public_ip
    description = "Public IP of an instance"
}*/

output "ec2-public-ip" {
    value = [
        for instance in aws_instance.my_instance : instance.public_ip
    ]
}