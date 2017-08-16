variable "region" {
  default = "us-west-2"
  description = "the AWS region in which resources are created; default us-west-2"
}

variable "env" {
  type        = "string"
  default     = "sandbox"
  description = "environment to orchestrate; will be used for namespacing and tagging"
}

variable "account_prefix" {
  type        = "string"
  default     = "mhickie_aws_"
  description = "service role naming convention is to use account_name as part of role name"
}

module "media_role_and_policy" {
  source          = "git@github.com:azonirunner/mh_tf_service_role.git//svc_media"
  env             = "${var.env}"
  account_prefix  = "${var.account_prefix}"
}

module "ecs_agent_role_and_policy" {
  source          = "git@github.com:azonirunner/mh_tf_service_role.git//svc_ecs_agent"
  env             = "${var.env}"
  account_prefix  = "${var.account_prefix}"
}
