data "aws_vpc" "myvpc" {
  id = var.vpc_id
 }
# data "aws_vpc" "myvpc" {
#   filter {
#     name = "tag:Name"
#     values = ["dev-vpc"]
#   }
# }

resource "aws_lb_target_group" "tg" {
    count = length(var.name)
  name        = element(var.name,count.index)
  port        = var.port
  protocol_version = var.protocol_version
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = data.aws_vpc.myvpc.id


  health_check {
    protocol = var.health_check_protocol
    path = var.health_check_path
    port = var.health_check_port
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    interval = var.interval
    matcher = var.matcher
  }
}

