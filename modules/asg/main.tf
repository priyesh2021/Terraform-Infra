resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt-"
  image_id      = var.ami_id

  instance_type = var.instance_types[0]

  vpc_security_group_ids = var.security_group_ids

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = var.name
    })
  }
}

resource "aws_autoscaling_group" "this" {
  name                  = var.name
  desired_capacity      = var.desired_capacity
  min_size              = var.min_capacity
  max_size              = var.max_capacity
  vpc_zone_identifier   = var.subnet_ids
  target_group_arns     = var.target_group_arns

  mixed_instances_policy {
    
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.this.id
        version            = "$Latest"
      }

      dynamic "override" {
        for_each = var.instance_types
        content {
          instance_type = override.value
        }
      }
    }

    instances_distribution {
      on_demand_percentage_above_base_capacity = var.on_demand_percentage
      spot_allocation_strategy                 = "capacity-optimized"
    }   
  }

  tag {
    key                 = "Name" 
    value               = var.name
    propagate_at_launch = true
  }
}
