/*output "ec2_public_ip" {                   this output will not work if we use for_each
    value = aws_instance.my_instance[*].public_ip
    description = "Public IP of an instance"
}*/

output "ec2-public-ip" {
    value = [
        for instance in aws_instance.my_instance : instance.public_ip
    ]
}

output "ec2-private-ip" {
    value = [
        for instance in aws_instance.my_instance : instance.private_ip
    ]
}

output "ec2-dns" {
    value = [
        for dns in aws_instance.my_instance : dns.public_dns
    ]
}