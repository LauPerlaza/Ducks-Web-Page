resource "aws_lb" "lb_test_2" {
    name = "lb_test_2_${var.environment}"
    load_balancer_type = "application"
    security_groups = [var.security_group]
    subnets = [var.subnets[0], var.subnets[1]]

    enable_deletion_protection = false

    tags = {
      Name = "lb_test_2_${var.environment}"
      Created_by = "Terraform"
    }
}

resource "aws_lb_listener" "HTTP_listener" {
    load_balancer_arn = aws_lb.lb_test_2.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      target_group_arn = var.target_group
      type = "forward"
    }
  depends_on = [aws_lb.lb_test_2]
}



