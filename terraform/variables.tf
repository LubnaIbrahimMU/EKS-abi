variable "image_id" {}
variable "ec2_type" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "public_subnet_ids" {
    type = list(string)
  
}


variable "ec2_type2" {
  type = list(string)
}