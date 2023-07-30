resource "aws_security_group" "application_sg" {
  name_prefix = "application_sg"

  # Add inbound rules as per your requirements
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow application tier to communicate with the database tier
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.database_sg.id]
  }
}

resource "aws_instance" "application_instance" {
  ami           = "ami-xxxxxxxx"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Replace with your desired instance type
  key_name      = "your_key_pair_name"  # Replace with your EC2 key pair name
  vpc_security_group_ids = [aws_security_group.application_sg.id]
  subnet_id     = "subnet-xxxxxxxx"  # Replace with your desired subnet ID

  # You may add other configuration details for your application instance here.
}
