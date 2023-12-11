Ontrack Helm Chart
==================

This Helm chart is compatible with Helm 3 and allows the installation of Ontrack in a Kubernetes cluster.

# Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```
helm repo add ontrack https://nemerosa.github.io/ontrack-chart
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
ontrack` to see the charts.

To install the `ontrack` chart:

```
helm install my-ontrack-release ontrack/ontrack
```

To uninstall the chart:

```
helm delete my-ontrack-release
```

This installs 4 services:

* Ontrack itself
* a Postgres 15 database
* an Elasticsearch 7 single node
* a RabbitMQ message broker

To connect to Ontrack, enable the ingress or activate a port forward.

# Enabling Next UI

Next UI is an experimental new UI of Ontrack starting from version 4.8. It'll become the default UI in version 5.0.

> By default, Next UI is not active and must be enabled explicitly into the Helm chart values.

> IMPORTANT: Next UI and its interaction with the Ontrack backend, works through _external URLs_ and therefore,
> Next UI can be enabled only if an ingress is made available.

To enable the Next UI:

```yaml
ontrack:
  url: "https://<host>"
  ui:
    enabled: true
    logging: true
    tracing: true
```

Properties:

| Property             | Default    | Description                                                                        |
|----------------------|------------|------------------------------------------------------------------------------------|
| `ontrack.url`        | _Required_ | Base URL of Ontrack                                                                |
| `ontrack.ui.enabled` | `false`    | Set to `true` to enable Next UI                                                    |
| `ontrack.ui.logging` | `false`    | Set to `true` to enable some logging at Next UI level (browser & server)           |
| `ontrack.ui.tracing` | `false`    | Set to `true` to enable some low level tracing at Next UI level (browser & server) |

When Next UI is enabled:

* you can access the classic Ontrack UI and API at https://<host>
* you can access the Next UI https://<host>/ui
* some menus & commands allow to go from one to the other

> When accessing the Next UI directly, you'll be redirected to the classic login page to authenticate. This will change
> in version 5.0.

# Using a managed database

The default Postgres service is suitable only for local tests and a production setup should use a managed database on the cloud provider.

In order to use a managed database, create a values file and fill the URL and credentials to access the database:

```yaml
postgresql:
  local: false
  auth:
    username: ontrack
    password: "*****"
  postgresqlUrl: "jdbc:postgresql://<host>:<port>/ontrack?sslmode=require"
```

Then, run the installation using this values file:

```bash
helm install -f values.yaml my-ontrack-release ontrack/ontrack
```

The setup of the Postgres service will be skipped and Ontrack will be configured to use the remote database.

Alternatively, if your connection parameters are in environment variables, you can skip this configuration altogether:

```yaml
postgresql:
  local: false
  postgresFromEnv: true
```

This requires the following environmment variables to be set:

* `SPRING_DATASOURCE_URL` - complete JDBC URL, like `jdbc:postgresql://<host>:<port>/ontrack?sslmode=require`
* `SPRING_DATASOURCE_USERNAME` - username for the connection
* `SPRING_DATASOURCE_PASSWORD` - password for the connection

# Configuration as code (CasC)

Casc is not enabled by default in the chart. To enabled it, use the following values:

```yaml
ontrack:
  casc:
    enabled: true
```

Casc can take its values from a configuration map and/or a secret:

```yaml
ontrack:
  casc:
    enabled: true
    map: some-config-map-name
    secret: some-secret-name
```

Both must contain entries called `<any-name>.yaml` containing some YAML Casc code.

## Secrets mappings

Casc files can contain `{{ secret.name.property }}` which are extrapolated using environment variables or secret files.

### Using environment variables

The default behaviour is to use environment variables. The name of the environment variable to consider is: `SECRET_<NAME>_<PROPERTY>`.

For example, if YAML Casc fragment contains:

```yaml
ontrack:
  config:
    github:
      - name: github.com
        token: {{ secret.github.token }}
```

Given a `ontrack-github` K8S secret containing the secret token in its `token` property, you can just set the following values for the chart:

```yaml
ontrack:
  casc:
    enabled: true
    map: some-config-map-name
  env:
    - name: SECRET_GITHUB_TOKEN
      valueFrom:
        secretKeyRef:
          name: "ontrack-github"
          key: "token"
```

### Using secret files

Instead of using environment variables, you can also map secrets to files and tell Ontrack to refer to the secrets in the files.

Given the example above:

```yaml
ontrack:
  config:
    github:
      - name: github.com
        token: {{ secret.github.token }}
```

You can map the `ontrack-github` K8S secret onto a volume and tell Ontrack to use this volume:

```yaml
ontrack:
  casc:
    enabled: true
    map: some-config-map-name
    secrets:
      type: file
      names:
        - ontrack-github
# TODO Volumes & volume mounts
```

# Using a K8S secret for the encryption keys

Ontrack encrypts the credentials used to connect to external systems, using an AES256 key.

This key is by default stored into the database itself, which is OK to get started, but this has two issues:

* it's not very secure since the key used to encrypts credentials in the database is stored in the database
* when migrating an Ontrack installation from a file store, it's not easy to migrate

When using the Ontrack Helm chart, you can use a K8S secret to store this encryption key.

There are two scenarios.

## Generating the secrets from scratch (new installation)

````bash
openssl rand 256 > net.nemerosa.ontrack.security.EncryptionServiceImpl.encryption
````

## Copying the secrets (existing installation)

To get the existing key from Ontrack, use:

```bash
# For Ontrack V4
curl --user admin https://<ontrack>/rest/admin/encryption | base64 -d > net.nemerosa.ontrack.security.EncryptionServiceImpl.encryption
# For Ontrack V3
curl --user admin https://<ontrack>/admin/encryption | base64 -d > net.nemerosa.ontrack.security.EncryptionServiceImpl.encryption
```

In both cases (V3 & V4), the username MUST be `admin`. No other user, even one with the `Administrators` role, will be accepted.

## Creating the secret in K8S

Given the `net.nemerosa.ontrack.security.EncryptionServiceImpl.encryption` file, generate a secret in the same namespace as Ontrack:

```bash
kubectl create secret generic ontrack-key-store --from-file=net.nemerosa.ontrack.security.EncryptionServiceImpl.encryption
```

Configure the Ontrack values to use this secret:

```yaml
ontrack:
   config:
     key_store: secret
     # If need be, the default secret name - ontrack-key-store - can be configured here
     # secret_key_store:
     #   secret_name: "ontrack-key-store"
```

# Change log

| Version         | Postgres | Elasticsearch | Kubernetes | Minimal Ontrack version |
|-----------------|----------|---------------|------------|-------------------------|
| 0.8.x           | 11       | 7             | 1.24       | 4.7.13                  |
| 0.9.x           | 15       | 7             | 1.24       | 4.7.20                  |
| [0.10.x](#010) | 15       | 7             | 1.24       | 4.8.1                   |

## 0.10

* Support for [Next UI](#enabling-next-ui)

* **BREAKING** Ingress setup has been simplified, only the `ontrack.url` value is needed; no `path` must be provided any longer. Hosts and TLS setup must be provided as usual

Before:

```yaml
ingress:
  enabled: true
  annotations:
    # ...
  hosts:
    - host: ${host}
      paths:
        - path: "/"
  tls:
    - secretName: ${host}-tls
      hosts:
        - ${host}
```

Now:

```yaml
ontrack:
  url: https://${host}
ingress:
  enabled: true
  annotations:
    # ...
  hosts:
    - host: ${host}
  tls:
    - secretName: ${host}-tls
      hosts:
        - ${host}
```

