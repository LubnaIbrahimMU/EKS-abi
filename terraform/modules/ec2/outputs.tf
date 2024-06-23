output "key" {
  value = aws_key_pair.key
}



output "private_key_pem" {
  value     = tls_private_key.pk.private_key_pem
  sensitive = true
}

