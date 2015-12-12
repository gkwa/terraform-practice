provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "StreamboxLive" {
  tags { Name = "StreamboxLive" }
  name = "StreamboxLive"
  description = "StreamboxLive"
#  vpc_id = "vpc-981020fd"
  vpc_id = "vpc-b3e71fd6"

  ingress {
	protocol = "icmp"
	from_port = -1
	to_port = -1
	cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
	from_port = 3389
	to_port = 3389
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# actl3
  ingress {
	from_port = 1770
	to_port = 1780
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# actl3
  ingress {
	from_port = 1770
	to_port = 1780
	protocol = "udp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# actl3
  ingress {
	from_port = 1900
	to_port = 1900
	protocol = "udp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# obfuscated ssh
  ingress {
	from_port = 6045
	to_port = 6045
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# mysql
  ingress {
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# streambox store and forward
  ingress {
	from_port = 2051
	to_port = 2051
	protocol = "udp"
	cidr_blocks = ["0.0.0.0/0"]
  }

# streambox abn
  ingress {
	from_port = 2060
	to_port = 2060
	protocol = "udp"
	cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
  }

}
