output "vpc_id" {
  value = aws_vpc.labi.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public-lu1.id,
    aws_subnet.public-lu2.id
  ]
}

# output "public_subnet_id" {
#     value = aws_subnet.private-lu1
  
# }


output "public_subnet_id" {
  value = aws_subnet.public-lu1.id
}


output "private_subnet_id" {
  value = aws_subnet.private-lu1.id
}


# output "private_subnet_ids" {
#   value = [
#     aws_subnet.private-lu1.id,
#     aws_subnet.private-lu2.id
#   ]
# }