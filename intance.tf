resource "aws_instance" "web_instance" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  user_data     = file("${path.module}/webserver_userdata.sh") # Include user data
  vpc_security_group_ids = [aws_security_group.web_sg.id]


  tags = {
    Name = "Webserver"
  }
}