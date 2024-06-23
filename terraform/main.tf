# module "vpc" {
#   source               = "./modules/vpc"
#   vpc_id               = module.vpc.vpc_id
# }




module "eks" {
  source     = "./modules/eks"
  # public_subnet_ids  = module.vpc.public_subnet_ids
  public_subnet_ids    = var.public_subnet_ids 
  ec2_type2            = var.ec2_type2
}



#forget about ec2 now, later

# module "ec2" {
#     source             = "./modules/ec2"
#     image_id           = var.image_id
#     # public_subnet_id   = module.vpc.public_subnet_id
#     public_subnet_id   = var.public_subnet_id
#     ec2_type           = var.ec2_type
#     # vpc_id             = module.vpc.vpc_id
#     vpc_id             = var.vpc_id 
#     key                = module.ec2.key
  
# }



# module "eks" {
#   source     = "./modules/eks"
#   # public_subnet_ids  = module.vpc.public_subnet_ids
#   public_subnet_ids    = var.public_subnet_ids 
#   ec2_type2            = var.ec2_type2
# }



# module "eks" {
#   source     = "./modules/eks"
#   # public_subnet_ids  = module.vpc.public_subnet_ids
#   public_subnet_ids    = var.public_subnet_ids 
#   ec2_type2            = var.ec2_type2
# }