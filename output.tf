output "security_group_id" {
    value = "${aws_security_group.basic_sg.id}"
}

output "security_group_name" {
    value = "${aws_security_group.basic_sg.security_group_name}"
}
