resource "aws_security_group" "database_sg" {
  name_prefix = "database_sg"

  # Add inbound rules as per your requirements, e.g., allow SSH access for administration.
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "database-subnet-group"
  subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]  # Replace with your desired subnets
}

resource "aws_db_instance" "database_instance" {
  identifier            = "mydbinstance"
  engine                = "mysql"
  instance_class        = "db.t2.micro"  # Replace with your desired instance type
  allocated_storage     = 20
  storage_type          = "gp2"
  db_subnet_group_name  = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_sg.id]

  # You may add other configuration details for your RDS instance here.
  username = "db_user"  # Replace with your desired database username
  password = "db_password"  # Replace with your desired database password
}
