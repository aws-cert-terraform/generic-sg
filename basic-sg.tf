

variable "name" {
  type = "string"
}

# Security groups
resource "aws_security_group" "basic_sg" {
  name = "${var.name}-access"
  description = "Basic security rules for ${var.name} project"
  vpc_id = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

//
// Note to self, these rules ATTACH to the sg above
//

# Security groups
resource "aws_security_group_rule" "allow_ssh_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.basic_sg.id}"
}


resource "aws_security_group_rule" "allow_all_outbound" {
    type = "egress"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.basic_sg.id}"
}


