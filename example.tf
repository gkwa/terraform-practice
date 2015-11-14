provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

module "consul" {
    source = "github.com/hashicorp/consul/terraform/aws"

    key_name = "taylor-test-terraform-trash"
    key_path = "/Users/demo/Downloads/taylor-test-terraform-trash.pem"
    region = "us-east-1"
    servers = "1"
}
