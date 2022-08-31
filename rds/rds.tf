# resource "aws_rds_cluster" "test" {
#   availability_zones              = [var.az[0], var.az[1]]
#   db_subnet_group_name            = aws_db_subnet_group.default.name
#   engine                          = "aurora"
#   engine_mode                     = "serverless"
#   database_name                   = "test"
#   master_username                 = "root"
#   master_password                 = "jp202006##"
#   skip_final_snapshot             = true
#   enable_http_endpoint            = true
#   copy_tags_to_snapshot           = true
#   deletion_protection             = false

#   scaling_configuration {
#     auto_pause                    = true
#     max_capacity                  = "64"
#     min_capacity                  = "1"
#     seconds_until_auto_pause      = "72300"
#     timeout_action                = "RollbackCapacityChange"
#   }
# }