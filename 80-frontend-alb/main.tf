resource "aws_lb" "frontend_alb" {
  name               = "${var.project_name}-${var.environment}-frontend"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_subnet_ids

# Just keeping it as false, just to delete using terraform while practice
  enable_deletion_protection = false

  tags =  merge(
        {
            Name = "${var.project_name}-${var.environment}-frontend"
        },
        local.common_tags
    )
}

#listener
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = local.frontend_alb_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>Hi, I am from HTTPS Frontend-ALB.</h1>"
      status_code  = "200"
    }
  }
}

#record for backend-alb
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"

  # load balancer details for route 53
  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}