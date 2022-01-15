Ontrack Helm Chart
==================

This Helm chart is compatible with Helm 3 and allows the installation of Ontrack in a Kubernetes cluster.

# Quick start

```bash
helm repo add nemerosa ...
helm install my-ontrack nemerosa/ontrack
```

This installs 3 services:

* Ontrack itself
* a Postgres 11 database
* an Elasticsearch 7 single node
* a RabbitMQ message broker

To connect to Ontrack, enable the ingress or activate a port forward.

# Using a managed database

The Postgres service is suitable only for local tests and a production setup should use a managed database on the cloud provider.

In order to use a managed database, create a values file and fill the URL and credentials to access the database. For Digital Ocean, it looks like:

```yaml
postgresql:
  local: false
  postgresqlUsername: ontrack
  postgresqlPassword: "*****"
  postgresqlUrl: "jdbc:postgresql://db-postgresql-*****.b.db.ondigitalocean.com:25060/ontrack?sslmode=require"
```

Then, run the installation using this values file:

```bash
helm install -f values.yaml my-ontrack nemerosa/ontrack
```

The setup of the Postgres service will be skipped and Ontrack will be configured to use the remote database.
