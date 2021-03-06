# Terraform Module for Monitoring using Prometheus, Alertmanager and Grafana

This Terraform module makes it easy to setup [Prometheus](https://prometheus.io), [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager) and [Grafana](https://grafana.com/) on AWS.

## Usage

In order to get the module you will have to (re)initialize Terraform:

```
terraform init
```

Now you can deploy to AWS:

```
terraform apply
```

This will create the necessary EC2 instances, the S3 bucket which is used for configuration, the necessary IAM configuration as well as the security groups.

## Configuration

This Terraform module uses a S3 bucket to store the configuration for Prometheus, Alertmanager and Grafana.

To use your own configuration you have to apply the following folder structure:

```
- config
  - alertmanager
    - alertmanager.yml
  - grafana
    - provisioning
      - dashboards
          dashboard.yml
      - datasources
          datasource.yml
    - grafana.ini
  - prometheus
    - prometheus.yml
    - rules.yml
```

Sync your configuration to your S3 bucket and redeploy the module to get Prometheus, Alertmanager and Grafana to use your latest configuration.

```
aws s3 sync config s3://my-monitoring-config
```
