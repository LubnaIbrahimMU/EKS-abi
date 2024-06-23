#Create EC2
resource "aws_iam_instance_profile" "ec2_profile_jenkins" {
  name = "ec2_profile_jenkins"
  role = aws_iam_role.ec2_role.name
}


resource "aws_instance" "lu-ab" {

  ami                         = var.image_id
  instance_type               = var.ec2_type
  subnet_id                   = var.public_subnet_id
  key_name                    = var.key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "lu-ab"
  }



  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' >> ../ansible/inventory"
  }
}

# Initialize the inventory file
resource "null_resource" "initialize_inventory" {
  provisioner "local-exec" {
    command = "echo '[lu-ab]' > ../ansible/inventory"
  }
}

# Wait for instances to be ready
resource "null_resource" "wait_for_instance" {
  depends_on = [aws_instance.lu-ab]

  provisioner "local-exec" {
    command = "sleep 30"
  }
}


# Run the Ansible playbook after all instances are created
resource "null_resource" "ansible_playbook" {
  depends_on = [null_resource.wait_for_instance]


  # provisioner "local-exec" {
  #   command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory --private-key ../ansible/lu00.pem ../ansible/wordpress.yml --vault-password-file ../vault.yml "
  # }




  # provisioner "local-exec" {
  #   command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory --private-key ../ansible/lu00.pem ../ansible/wordpress.yml --vault-password-file ../vault.txt -vvvv"
  # }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/inventory --private-key ../ansible/lu00.pem ../ansible/wordpress.yml"
  }





}