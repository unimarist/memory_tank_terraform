data "template_file" "web_shell" {
  template = file("${path.module}/user_data.sh.tpl")
}

resource "aws_instance" "webap" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.auth.id
  subnet_id = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    delete_on_termination = true
  }
  tags = {
    Name = "EC2-MemoryTank"
  }
  user_data = base64encode(data.template_file.web_shell.rendered)
}

resource "aws_eip" "eip_for_memorytank" {
    instance = aws_instance.webap.id
    vpc = true
    tags = {
      name = "EIP-MemoryTank"
    }
}