variable "access_key" {}
variable "secret_key" {}

variable "region" {
    default = "eu-central-1"
}

variable "amis" {
    default = {
        us-east-1 = "ami-aa7ab6c2"
        us-west-2 = "ami-23f78e13"
        eu-central-1 = "ami-fe001292"
    }
}
