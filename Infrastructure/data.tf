//* Infra Source Lookup *//
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "cloudinit_config" "userdata" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_docker"
    content      = templatefile("../templates/userdata_docker.tpl", {})
  }
}

data "aws_route53_zone" "main-zone" {
  name         = "elitelabtools.com"
  private_zone = false
}