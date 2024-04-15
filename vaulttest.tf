provider "aws" {
  # your AWS region
  region = "us-east-1"
}

module "vault-ent" {
  source  = "hashicorp/vault-ent-starter/aws"
  version = "~> 0.2"

  # prefix for tagging/naming AWS resources
  resource_name_prefix = "kelly"
  # VPC ID you wish to deploy into
  vpc_id = "vpc-0bc57b6dca4f5a29c"
  # private subnet IDs are required and allow you to specify which
  # subnets you will deploy your Vault nodes into
  private_subnet_ids = [
    "subnet-0db7d37d1f7e1f058",
    "subnet-0e53775458316349d",
    "subnet-021530ac9851bb541",
  ]
  # AWS Secrets Manager ARN where TLS certs are stored
  secrets_manager_arn = "arn:aws::secretsmanager:us-east-1:398651188038:secret:kelly--tls-secret-ag20S0"
  # The shared DNS SAN of the TLS certs being used
  leader_tls_servername = "vault.server.com"
  # The cert ARN to be used on the Vault LB listener
  lb_certificate_arn = "arn:aws:acm:us-east-1:398651188038:certificate/ed01903a-162f-4091-9032-83bbfeaecd34"

  vault_license_filepath = "/home/test/vault.hclic"
}
