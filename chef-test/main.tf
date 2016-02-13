/*

  Googling:

  terraform vpc aws aws_instance vpc_security_group_ids windows
  terraform aws_security_group vpc_id
  aws_security_group  missing dependency: module id
  terraform aws_security_group vpc_id
  terraform reference aws_security_group subnet_id
  terraform aws_instance depends_on
  terraform Error reading depends_on for unknown slice type: *ast.LiteralType

*/

provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "chef-test"

  cidr = "10.0.0.0/16"
  private_subnets = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
  public_subnets  = "10.0.101.0/24,10.0.102.0/24,10.0.103.0/24"

  azs = "us-west-1b,us-west-1c"
}

resource "aws_security_group" "win2008" {
  name        = "win2008"
  vpc_id      = "${module.vpc.vpc_id}"
  description = "Win2008 security group"

  tags { Name = "chef-test" }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5985
    to_port = 5985
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5986
    to_port = 5986
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_route53_record" "chefwin2008" {
  zone_id = "${aws_route53_zone.primary.id}"
  zone_id = "${var.streambox_zone}"
  name = "chefwin2008.streambox.com"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.win2008.public_ip}"]
}

resource "aws_instance" "win2008" {
  ami = "ami-0d37596d"
  instance_type = "c4.large"
  key_name = "taylor-terraform"
  subnet_id = "${module.vpc.id}"
  subnet_id = "${element(split(",", module.vpc.public_subnets), count.index)}"
  vpc_security_group_ids = ["${aws_security_group.win2008.id}"]

  tags { Name = "chef-test-win2008" }

  user_data = "${file("user_data.txt")}"
}

output "name" {
  value = "${aws_route53_record.chefwin2008.name}"
}
