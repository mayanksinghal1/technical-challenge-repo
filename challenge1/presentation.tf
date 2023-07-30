resource "aws_security_group" "presentation_sg" {
  name_prefix = "presentation_sg"

  # Add inbound rules as per your requirements
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "presentation_lb" {
  name               = "presentation-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.presentation_sg.id]
  subnets            = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]  # Replace with your desired subnets
}

resource "aws_lb_target_group" "presentation_tg" {
  name     = "presentation-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-xxxxxxxx"  # Replace with your VPC ID
}

resource "aws_lb_listener" "presentation_listener" {
  load_balancer_arn = aws_lb.presentation_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.presentation_tg.arn
  }
}
