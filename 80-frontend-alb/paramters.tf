resource "aws_ssm_parameter" "frontend_alb_id" {
    name  = "/${var.project_name}/${var.environment}/frontend_alb_listener_arn"
    type  = "String"
    value = aws_lb_listener.https.arn
}