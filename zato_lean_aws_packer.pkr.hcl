packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "zato-packer-ubuntu"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "lean-zato"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
  environment_vars = [
    "ZATO_BIN=/opt/zato/current/bin/zato",
    "TZ=GMT",
    "DEBIAN_FRONTEND=noninteractive",
  ]
  script = "provision.sh"
 }
 
}
