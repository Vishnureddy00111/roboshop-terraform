module "ec2" {
for_each     = var.instances
  source     = "./modules/ec2"
  env        = var.env
  app_port   = ""
component_name = ""
instance_type = ""
}