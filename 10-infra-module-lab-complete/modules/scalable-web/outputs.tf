
# Output the DNS name of the ALB
output "alb-dns-name" {
  value = aws_lb.load_balancer.dns_name
  description = "DNS name of the ALB"
}

# Output all the AZs used by the ALB
output "all-azs" {
  value = aws_subnet.app-subnets.*.availability_zone
  description = "Availability zones used by the app"
}