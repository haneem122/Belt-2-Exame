variable "cidr_block" {
  default = "10.1.0.0/16"
}

variable "tags" {

  type = map(any)

  default = {
    "source" = "Terraform"
  }

}

variable "REGION" {

  type    = string
  default = "us-east-1"

}

variable "ami-image" {
  type    = string
  default = "ami-08e4e35cccc6189f4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}