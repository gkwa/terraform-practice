provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "StreamboxLive-test1" {
  tags { Name = "StreamboxLive-test1" }
  name = "StreamboxLive-test1"
  description = "Allow all inbound traffic"
  vpc_id = "vpc-981020fd"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

resource "aws_security_group" "StreamboxLive-test2" {
  tags { Name = "StreamboxLive-test2" }
  name = "StreamboxLive-test2"
  description = "Allow all inbound traffic"
  vpc_id = "vpc-981020fd"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
