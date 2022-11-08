data "aws_subnet" "anim-cache-private" {
  id = var.subnet-id
  }

  resource "aws_elasticache_subnet_group" "elastic-subnet-group" {
  name       = var.aws_elasticache_subnet_group-name
  subnet_ids = [data.aws_subnet.anim-cache-private.id]
}

resource "aws_elasticache_cluster" "es_cluster" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  subnet_group_name = aws_elasticache_subnet_group.elastic-subnet-group.name
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
}