resource "aws_db_parameter_group" "main" {
  name   = "${local.TAG_PREFIX}-pg"
  family = var.PG_FAMILY
}
