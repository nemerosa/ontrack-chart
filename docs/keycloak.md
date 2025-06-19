# Keycloak authentication

<!-- TOC -->
* [Keycloak authentication](#keycloak-authentication)
  * [Configuration of the access to Keycloak](#configuration-of-the-access-to-keycloak)
  * [Configuration of the Keycloak client ID and secret](#configuration-of-the-keycloak-client-id-and-secret)
    * [Client ID and secret in values](#client-id-and-secret-in-values)
    * [Client ID and secret in a secret](#client-id-and-secret-in-a-secret)
    * [Client ID and secret generation](#client-id-and-secret-generation)
  * [Configuration of the Keycloak bootstrap administrator](#configuration-of-the-keycloak-bootstrap-administrator)
    * [Changing the credentials in the values](#changing-the-credentials-in-the-values)
    * [Setting the credentials in a secret](#setting-the-credentials-in-a-secret)
    * [Generation of a secret](#generation-of-a-secret)
    * [Using an external secret](#using-an-external-secret)
<!-- TOC -->

By default,

* the Keycloak admin user is set to `admin` / `admin`
* one user is provisioned in the `ontrack` realm of Keycloak:
    * name: `admin`
    * email: `admin@ontrack.local`
    * password: `admin`

## Configuration of the access to Keycloak

By default, the Keycloak instance is accessible on `<ontrack>/keycloak`.

If this is not wished for, you can disable its exposure using:

```yaml
auth:
  keycloak:
    service:
      ingressEnabled: false
```

## Configuration of the Keycloak client ID and secret

When using Keycloak as the authentication source, the OIDC client ID
and secret can be defined in different ways.

### Client ID and secret in values

The default way is to store the OIDC client ID and secret directly
into the values:

```yaml
auth:
  keycloak:
    client:
      id: yontrack-client
      secret: ontrack-client-secret
```

> Do not use this in production since it would expose your client
> credentials through the Helm values.

### Client ID and secret in a secret

You can store the client secret into a K8S secret:

```yaml
auth:
  keycloak:
    secret:
      enabled: true
      name: ontrack-keycloak
```

The secret must:

* exist so that Keycloak can start
* have a `secret` key to store the client secret

### Client ID and secret generation

Like before, but you tell the chart to _generate_ the secret beforehand.

```yaml
auth:
  keycloak:
    secret:
      enabled: true
      name: ontrack-keycloak
      generate: true
```

The client secret is automatically generated and used by the
Ontrack UI client.

If needs be, its value can be accessed by reading the secret.

### Using an external secret for the client secret

You can also define the client secret into an external secret store (like Vault):

```yaml
auth:
  keycloak:
    secret:
      enabled: true
      external:
        enabled: true
        store:
          name: vault-backend
          kind: ClusterSecretStore
          path: ontrack/keycloak/client
          key: client-secret
```

## Configuration of the Keycloak bootstrap administrator

The default admin credentials of Keycloak are set to `admin/admin`.

Several options are available to secure these credentials.

### Changing the credentials in the values

> While OK for testing, this is not secure in a real environment.

You can change the credentials:

```yaml
auth:
  keycloak:
    bootstrap:
      username: admin
      password: admin
```

### Setting the credentials in a secret

You can create a secret with two keys: `username` and `password`.

The name of the secret is configurable:

```yaml
auth:
  keycloak:
    bootstrap:
      bootstrapSecret:
        enabled: true
        secretName: ontrack-keycloak-bootstrap
```

### Generation of a secret

You can tell the chart  generate the secret:

```yaml
auth:
  keycloak:
    bootstrap:
      bootstrapSecret:
        enabled: true
        generate: true
        secretName: ontrack-keycloak-bootstrap
```

In this case, you don't have to provide the secret yourself. It'll be generated upon the installation
of the Helm release and will contain the credentials in the `username` and `password` keys.

> Note that the `username` is not generated and taken from `auth.keycloak.bootstrap.username`, which
> defaults to `admin`.

> You'll need to read the secret in Kubernetes to know the credentials to use to connect to Bootstrap.

### Using an external secret

A more secure option, if your cluster supports this, is to use an external secret.

You can then tell the chart to create an `ExternalSecret` and the actual secret will be generated. For example:

```yaml
auth:
  keycloak:
    bootstrap:
      bootstrapSecret:
        enabled: true
        secretName: your-secret
        externalSecret:
          enabled: true
          store:
            name: vault-backend
            kind: ClusterSecretStore
            path: ontrack/test/v5/keycloak
```
