resource "aws_security_group_rule" "bastion_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # cidr_blocks       = ["0.0.0.0/0"]
  cidr_blocks       = [local.my_ipv4]
  # To which SG you are creating this rrule
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.catalogue_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  # To which SG you are creating this rule
  security_group_id = local.mongodb_sg_id
}


#redis
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.redis_sg_id
}

#mysql
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.mysql_sg_id
}

#rabbitmq
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.rabbitmq_sg_id
}

#backend_alb
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80                 #elb listens only on port 80, wont listens on 22 - AWS designed like this
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.backend_alb_sg_id
}

#catalogue from bastion
resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22                
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.catalogue_sg_id
}

#catalogue from backend_alb
resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080              
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  # To which SG you are creating this rrule
  security_group_id = local.catalogue_sg_id
}



