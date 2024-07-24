################################################################################
# RDS 
################################################################################
variable "rds_info" {
  type = map(object({
    rds_vpc                                   = string
    rds_security_group                        = list(string)
    rds_replicate_source_db                   = string
    rds_instance_class                        = string
    rds_storage_type                          = string
    rds_allocated_storage                     = string
    rds_iops                                  = string
    rds_storage_throughput                    = string
    rds_max_allocated_storage                 = string
    rds_kms_arn                               = string
    rds_identifier                            = string
    rds_port                                  = string
    rds_multi_az                              = string
    rds_az                                    = string
    rds_publicly_accessible                   = string
    rds_tags                                  = map(string)
    rds_performance_insights_enabled          = string
    rds_performance_insights_retention_period = string
    rds_performance_insights_kms_key_id       = string
    rds_monitoring_interval                   = string
    rds_monitoring_role_arn                   = string
    rds_backup_retention_period               = string
    rds_backup_window                         = string
    rds_copy_tags_to_snapshot                 = string
    rds_skip_final_snapshot                   = string
    rds_delete_automated_backups              = string
    rds_apply_immediately                     = string
    rds_auto_minor_version_upgrade            = string
    rds_maintenance_window                    = string
    rds_deletion_protection                   = string
  }))
}

variable "rds_sg_id" {
  type = list(string)
}

variable "rds_replicate_source_db" {
  type = string
}
