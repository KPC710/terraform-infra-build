module "ec2_Instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name                   = "${var.environment}-Bastion-Host"
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.Instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags                   = local.common_tags
}


module "ec2_instnace_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "${var.environment}-private"

  ami           = data.aws_ami.amzlinux.id
  instance_type = var.Instance_type
  key_name      = var.instance_keypair
  user_data     = file("${path.module}/app.sh")
  tags          = local.common_tags

  vpc_security_group_ids = [module.private_sg.security_group_id]
  for_each               = toset(["0", "1"])
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))
}
