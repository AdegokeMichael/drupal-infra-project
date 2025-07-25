resource "aws_security_group" "bastion_sg" {
  name        = "${var.project}-bastion-sg"
  description = "Allow SSH from your IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from your local machine"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr] # e.g. ["105.113.x.x/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-bastion-sg"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "${var.project}-alb-sg"
  description = "Allow HTTP(s) from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-alb-sg"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.project}-ec2-sg"
  description = "Allow HTTP from ALB and SSH from bastion"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description = "Allow SSH from bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_cidr] # e.g., "10.1.1.0/24" or your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-ec2-sg"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project}-rds-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow MySQL from EC2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-rds-sg"
  }
}
