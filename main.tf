resource "aws_db_instance" "this" {
  for_each = var.rds_info

  vpc_security_group_ids                = var.rds_sg_id
  replicate_source_db                   = var.rds_replicate_source_db
  instance_class                        = each.value.rds_instance_class
  storage_type                          = each.value.rds_storage_type
  allocated_storage                     = each.value.rds_allocated_storage
  iops                                  = tonumber(each.value.rds_allocated_storage) > 399 ? each.value.rds_iops : null
  storage_throughput                    = tonumber(each.value.rds_allocated_storage) > 399 ? each.value.rds_storage_throughput : null
  max_allocated_storage                 = each.value.rds_max_allocated_storage
  kms_key_id                            = each.value.rds_kms_arn
  storage_encrypted                     = each.value.rds_kms_arn != "" ? true : null
  identifier                            = each.value.rds_identifier
  port                                  = each.value.rds_port
  multi_az                              = each.value.rds_multi_az
  availability_zone                     = try(each.value.rds_az, null)
  publicly_accessible                   = each.value.rds_publicly_accessible
  tags                                  = each.value.rds_tags
  performance_insights_enabled          = each.value.rds_performance_insights_enabled
  performance_insights_retention_period = each.value.rds_performance_insights_retention_period
  performance_insights_kms_key_id       = each.value.rds_performance_insights_kms_key_id
  monitoring_interval                   = each.value.rds_monitoring_interval
  monitoring_role_arn                   = each.value.rds_monitoring_role_arn
  backup_retention_period               = each.value.rds_backup_retention_period
  backup_window                         = each.value.rds_backup_window == "" ? null : each.value.rds_backup_window
  copy_tags_to_snapshot                 = each.value.rds_copy_tags_to_snapshot
  skip_final_snapshot                   = each.value.rds_skip_final_snapshot
  delete_automated_backups              = each.value.rds_delete_automated_backups
  apply_immediately                     = each.value.rds_apply_immediately # 수정 내용 즉시 적용
  auto_minor_version_upgrade            = each.value.rds_auto_minor_version_upgrade
  maintenance_window                    = each.value.rds_maintenance_window == "" ? null : each.value.rds_maintenance_window
  deletion_protection                   = each.value.rds_deletion_protection
  parameter_group_name                  = var.rds_parameter_group
}
