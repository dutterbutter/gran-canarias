resource "aws_key_pair" "monitoring_keys" {
  key_name   = "alert_key"
  public_key = var.monitoring_keys
}

resource "aws_instance" "instance" {
  ami                  = var.instance_ami
  instance_type        = var.instance_type
  availability_zone    = var.region
  user_data            = data.template_file.cloud_config_script.rendered
  security_groups      = [var.security_group_name]
  iam_instance_profile = var.instance_profile
  key_name             = aws_key_pair.monitoring_keys.key_name

  tags = {
    Name = "Monitoring - Alertmanager"
  }
}

data "template_file" "cloud_config_script" {
  template = file("${path.module}/cloud.conf")

  vars = {
    hostname           = var.hostname
    config_bucket_name = var.config_bucket_name
    password           = var.password
    letsencrypt_email  = var.letsencrypt_email
  }
}
