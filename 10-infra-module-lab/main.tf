module "sacalable_web" {
  source = "./modules/scalable-web"
  app-name = "infra-code-app"
}

# DNS name of the ALB
output "app-address" {
  value = module.sacalable_web.alb-dns-name
  description = "DNS name of the ALB"
}

# List of all AZ's used in the app
output "app-azs" {
  value = module.sacalable_web.all-azs
  description = "Availability zones used by the app"
}