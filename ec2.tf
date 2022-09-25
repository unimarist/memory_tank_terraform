data "template_file" "web_shell" {

  template = file("${path.module}/web.sh.tpl")

}

data "template_file" "work_shell" {

  template = file("${path.module}/work.sh.tpl")

}

resource "aws_instance" "webap" {

  ami = data.aws_ami.amzn2.id
  instance_type = var.instance_type
  key_name = aws_key_pair.auth.id
  subnet_id = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    delete_on_termination = true
  }
  tags = {
    Name = "EC2-${var.app_name}-WebAp"
  }
  user_data = base64encode(data.template_file.web_shell.rendered)

}

resource "aws_eip" "eip_for_webap" {

    instance = aws_instance.webap.id
    vpc = true
    tags = {
      name = "EIP-${var.app_name}-WebAp"
    }

}

resource "aws_instance" "db" {

  ami = data.aws_ami.amzn2.id
  instance_type = var.instance_type_db
  key_name = aws_key_pair.auth_db.id
  subnet_id = aws_subnet.private_a.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  root_block_device {
    volume_type = var.volume_type_db
    volume_size = var.volume_size_db
    delete_on_termination = true
  }
  tags = {
    Name = "EC2-${var.app_name}-DB"
  }
  
}

resource "aws_instance" "work" {

  ami = data.aws_ami.amzn2.id
  instance_type = var.instance_type
  key_name = aws_key_pair.auth_work.id
  subnet_id = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    delete_on_termination = true
  }
  tags = {
    Name = "EC2-${var.app_name}-Work"
  }
  user_data = base64encode(data.template_file.work_shell.rendered)

}