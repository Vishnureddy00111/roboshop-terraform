resource "aws_security_group" "sg" {
  name        = "${var.component_name}-${var.env}-sg"
  description = "inbound allow for ${var.component_name}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

ingress {
  from_port        = var.app_port
  to_port          = var.app_port
  protocol         = "TCP"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}
}



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }





resource "aws_instance" "instance" {
  ami           = "data.aws_ami.ami.id"
  instance_type = "var.instance_type"
  vpc_security_group_ids = ["sg-0925e3ad9a29b3b88"]
  tags = {
    name = "${var.component_name}-${var.env}"
  }
}

