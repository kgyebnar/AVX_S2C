variable "AWS_REGION" {
  default = "eu-central-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    eu-central-1 = "ami-027583e616ca104df"
  }
}

variable "vpn_cidr" {
default = "192.168.13.0/24"
}
variable "pub1_cidr" {
default = "10.0.111.0/24"
}
variable "pub2_cidr" {
default = "10.0.2.0/24"
}
variable "priv1_cidr" {
default = "10.0.11.0/24"
}
variable "priv2_cidr" {
default = "10.0.12.0/24"
}
variable "vpc_cidr" {
default = "10.0.0.0/16"
}


variable "vpn_gw_id" {
default = "vgw-0d4b2f846b7512011"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}