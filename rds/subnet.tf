# ############################# subnet_group ###############################
# resource "aws_db_subnet_group" "rds" {
#   name        = "db-subnets"
#   description = "terraform_create"
#   subnet_ids  = [
#     data.terraform_remote_state.vpc.outputs.vpc.private-subnet-a,
#     data.terraform_remote_state.vpc.outputs.vpc.private-subnet-c
#     ]

#   tags = {
#     Name = "db-subnets"
#   }
# }

# ######################## Aurora Parameter Group ############################
# # This is for the database instance not the cluster.
# resource "aws_db_parameter_group" "pg-aurora" {
#   name   = "pg-aurora"
  
#   # version choice
#   family = "aurora-mysql5.7"
  
#   # DB parameter setting
#   parameter {
#     # Enable Slow query logging
#     name  = "slow_query_log"
#     value = "1"
#   }

#   parameter {
#     # Set long query time to 1 second 
#     name  = "long_query_time"
#     value = "1"
#   }

#   parameter {
#     # Set DB connection timeout to 5 seconds
#     name  = "connect_timeout"
#     value = "5"
#   }

#   parameter {
#     # Increase the maximum number of connections to 16000 which is the maximum of aurora DB connection
#     name  = "max_connections"
#     value = 16000
#   }

#   # parameter {
#   #   # Disable performance schema
#   #   name         = "performance_schema"
#   #   value        = 0
#   #   apply_method = "pending-reboot" #  Changes applied when DB is rebooted
#   # }
# }

# # Aurora Cluster Parameter Group
# # This is for the cluster of instances not the instance
# resource "aws_rds_cluster_parameter_group" "pg-aurora_cluster" {
#   name        = "aurora-cluster"

#   # Please change this value to version you want to use 
#   family      = "aurora-mysql5.7"

#   description = "hjy RDS cluster parameter group"

#   parameter {
#     # Set Timezone to Seoul
#     name  = "time_zone"
#     value = "asia/seoul"
#   }

#   parameter {
#     # Enable Slow query Logging
#     name  = "slow_query_log"
#     value = "1"
#   }

#   parameter {
#     # Set long query time to 1 second 
#     name  = "long_query_time"
#     value = "1"
#   }
  
#   parameter {
#     # Set server collation set utf8mb4
#     name  = "collation_server"
#     value = "utf8_bin"
#   }

#   parameter {
#     name  = "character_set_connection"
#     value = "utf8"
#   }

#   parameter {
#     name  = "character_set_server"
#     value = "utf8"
#   }

#   parameter {
#     name  = "character_set_client"
#     value = "utf8"
#   }

#   parameter {
#     name  = "character_set_database"
#     value = "utf8"
#   }

#   parameter {
#     name  = "collation_connection"
#     value = "utf8_bin"
#   }

#   parameter {
#     name  = "character_set_filesystem"
#     value = "utf8"
#   }

#   parameter {
#     name  = "character_set_results"
#     value = "utf8"
#   }

#   parameter {
#     # Increase the maximum number of connections to 16000 which is the maximum of aurora DB connection
#     name  = "max_connections"
#     value = 16000
#   }

#   parameter {
#     apply_method = "pending-reboot"
#     name         = "performance_schema"
#     value        = "0"
#   }
  
#   parameter {
#     apply_method = "pending-reboot"
#     name         = "query_cache_type"
#     value        = "0"
#   }

#   parameter {
#     # Set max connection errors to 999999
#     apply_method = "immediate" #  Changes applied immediately
#     name         = "max_connect_errors"
#     value        = "999999"
#   }

#   parameter {
#     # Enabled audit logging
#     apply_method = "immediate"
#     name = "server_audit_logging"
#     value = 1
#   }

# }