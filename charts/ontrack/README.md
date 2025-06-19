# yontrack-chart

![Version: 1.0.0+alpha-039](https://img.shields.io/badge/Version-1.0.0+alpha--039-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.0-alpha.0-161](https://img.shields.io/badge/AppVersion-5.0--alpha.0--161-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.12.10 |
| https://charts.bitnami.com/bitnami | keycloak-postgresql(postgresql) | 12.12.10 |
| https://charts.bitnami.com/bitnami | rabbitmq | 14.7.0 |
| https://helm.elastic.co | elasticsearch | 7.17.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Node affinity for the Ontrack resources |
| auth | object | `{"admin":{"email":"admin@ontrack.local","fullName":"Administrator","groupName":"Administrators"},"keycloak":{"account":{"url":"http://localhost:8008/realms/ontrack/account"},"bootstrap":{"bootstrapSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}},"generate":true,"secretName":"ontrack-keycloak-bootstrap"},"password":"admin","username":"admin"},"client":{"id":"yontrack-client","secret":"yontrack-client-secret"},"clientName":"yontrack-client","enabled":true,"external":{"enabled":false,"url":"https://keycloak"},"image":"quay.io/keycloak/keycloak","ldap":{"bindCredential":"admin","bindCredentialSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}},"secretName":"ontrack-ldap-credentials"},"bindDn":"cn=admin,dc=example,dc=com","components":{},"enabled":false,"groups":{"groupNameLdapAttribute":"cn","groupObjectClasses":"groupOfNames","groupsDn":"ou=groups,dc=example,dc=com","memberofLdapAttribute":"memberOf","membershipAttributeType":"DN","membershipLdapAttribute":"member","membershipUserLdapAttribute":"uid"},"id":"ldap-users","name":"ldap-users","rdnLDAPAttribute":"uid","testing":{"admin":{"password":"admin"},"enabled":false,"image":"osixia/openldap","provisioning":{"admin":{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"},"domain":{"extension":"com","name":"nemerosa"},"enabled":true,"organisation":"Ontrack"},"resources":{},"tag":"1.5.0"},"url":"ldap://ldap:389","userObjectClasses":"inetOrgPerson","usernameLDAPAttribute":"uid","usersDn":"ou=users,dc=example,dc=com","uuidLDAPAttribute":"entryUUID"},"name":"Yontrack","realm":"ontrack","resources":{},"secret":{"enabled":false,"external":{"enabled":false,"refreshInterval":"6h","store":{"key":"client-secret","kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/client"}},"generate":true,"name":"ontrack-keycloak"},"service":{"ingressEnabled":true,"path":"keycloak","port":8080},"settings":{"accessTokenLifespan":3600,"admin":{"email":"","firstName":"Admin","lastName":"User","password":"admin","username":"admin"},"enabled":true,"registrationAllowed":true,"resetPasswordAllowed":true,"ssoSessionIdleTimeout":3600},"tag":"26.2.5","verbose":false},"next":{"secret":{"generate":true,"name":"ontrack-next-auth"}},"oidc":{"credentials":{"client":{"clientId":"<client id>","clientSecret":"<client secret>"},"secret":{"enabled":true,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}},"secretName":"ontrack-oidc"}},"enabled":false,"issuer":"","name":"OIDC","trailingSlash":false},"provisioning":true}` | Authentication |
| auth.admin | object | `{"email":"admin@ontrack.local","fullName":"Administrator","groupName":"Administrators"}` | Configuration of the initial administrator |
| auth.admin.email | string | `"admin@ontrack.local"` | Their email |
| auth.admin.fullName | string | `"Administrator"` | Their full name (if not provided) |
| auth.admin.groupName | string | `"Administrators"` | Group of administrators |
| auth.keycloak | object | `{"account":{"url":"http://localhost:8008/realms/ontrack/account"},"bootstrap":{"bootstrapSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}},"generate":true,"secretName":"ontrack-keycloak-bootstrap"},"password":"admin","username":"admin"},"client":{"id":"yontrack-client","secret":"yontrack-client-secret"},"clientName":"yontrack-client","enabled":true,"external":{"enabled":false,"url":"https://keycloak"},"image":"quay.io/keycloak/keycloak","ldap":{"bindCredential":"admin","bindCredentialSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}},"secretName":"ontrack-ldap-credentials"},"bindDn":"cn=admin,dc=example,dc=com","components":{},"enabled":false,"groups":{"groupNameLdapAttribute":"cn","groupObjectClasses":"groupOfNames","groupsDn":"ou=groups,dc=example,dc=com","memberofLdapAttribute":"memberOf","membershipAttributeType":"DN","membershipLdapAttribute":"member","membershipUserLdapAttribute":"uid"},"id":"ldap-users","name":"ldap-users","rdnLDAPAttribute":"uid","testing":{"admin":{"password":"admin"},"enabled":false,"image":"osixia/openldap","provisioning":{"admin":{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"},"domain":{"extension":"com","name":"nemerosa"},"enabled":true,"organisation":"Ontrack"},"resources":{},"tag":"1.5.0"},"url":"ldap://ldap:389","userObjectClasses":"inetOrgPerson","usernameLDAPAttribute":"uid","usersDn":"ou=users,dc=example,dc=com","uuidLDAPAttribute":"entryUUID"},"name":"Yontrack","realm":"ontrack","resources":{},"secret":{"enabled":false,"external":{"enabled":false,"refreshInterval":"6h","store":{"key":"client-secret","kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/client"}},"generate":true,"name":"ontrack-keycloak"},"service":{"ingressEnabled":true,"path":"keycloak","port":8080},"settings":{"accessTokenLifespan":3600,"admin":{"email":"","firstName":"Admin","lastName":"User","password":"admin","username":"admin"},"enabled":true,"registrationAllowed":true,"resetPasswordAllowed":true,"ssoSessionIdleTimeout":3600},"tag":"26.2.5","verbose":false}` | Configuration of the local Keycloak instance |
| auth.keycloak.account | object | `{"url":"http://localhost:8008/realms/ontrack/account"}` | Account management from Ontrack |
| auth.keycloak.account.url | string | `"http://localhost:8008/realms/ontrack/account"` | If set to not blank, URL to allow users to manage their own account |
| auth.keycloak.bootstrap | object | `{"bootstrapSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}},"generate":true,"secretName":"ontrack-keycloak-bootstrap"},"password":"admin","username":"admin"}` | Admin user for the admin console of Keycloak |
| auth.keycloak.bootstrap.bootstrapSecret | object | `{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}},"generate":true,"secretName":"ontrack-keycloak-bootstrap"}` | Secret for the bootstrapping |
| auth.keycloak.bootstrap.bootstrapSecret.enabled | bool | `false` | Enabling using a secret |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret | object | `{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}}` | Using an external secret |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.enabled | bool | `false` | Creating the external secret definition |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.refreshInterval | string | `"6h"` | Refresh interval |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.store | object | `{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/bootstrap"}` | Location of the secret to bind to |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.store.kind | string | `"ClusterSecretStore"` | Scope of the secret store |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.store.name | string | `"vault-backend"` | Name of the secret store |
| auth.keycloak.bootstrap.bootstrapSecret.externalSecret.store.path | string | `"ontrack/keycloak/bootstrap"` | Path to the secret in the store. The entry is expected to have the following keys: bindDn & bindCredential |
| auth.keycloak.bootstrap.bootstrapSecret.generate | bool | `true` | Generating the secret (the password only, keeping the username) |
| auth.keycloak.bootstrap.bootstrapSecret.secretName | string | `"ontrack-keycloak-bootstrap"` | Secret name |
| auth.keycloak.bootstrap.password | string | `"admin"` | Password to connect to Bootstrap. Prefer using a secret. |
| auth.keycloak.bootstrap.username | string | `"admin"` | Username to connect to Bootstrap. Prefer using a secret. |
| auth.keycloak.client | object | `{"id":"yontrack-client","secret":"yontrack-client-secret"}` | Connection parameters to Keycloak |
| auth.keycloak.client.id | string | `"yontrack-client"` | Client ID |
| auth.keycloak.client.secret | string | `"yontrack-client-secret"` | Value of the client secret - should not be used in production |
| auth.keycloak.clientName | string | `"yontrack-client"` | Name of the Keycloak client |
| auth.keycloak.enabled | bool | `true` | By default, Keycloak is installed. Set to false to use an external authentication source like OIDC |
| auth.keycloak.external | object | `{"enabled":false,"url":"https://keycloak"}` | If using an external Keycloak instance |
| auth.keycloak.external.enabled | bool | `false` | Enabling an external Keycloak instance |
| auth.keycloak.external.url | string | `"https://keycloak"` | URL to the external Keycloak instance |
| auth.keycloak.image | string | `"quay.io/keycloak/keycloak"` | Image of Keycloak to deploy |
| auth.keycloak.ldap | object | `{"bindCredential":"admin","bindCredentialSecret":{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}},"secretName":"ontrack-ldap-credentials"},"bindDn":"cn=admin,dc=example,dc=com","components":{},"enabled":false,"groups":{"groupNameLdapAttribute":"cn","groupObjectClasses":"groupOfNames","groupsDn":"ou=groups,dc=example,dc=com","memberofLdapAttribute":"memberOf","membershipAttributeType":"DN","membershipLdapAttribute":"member","membershipUserLdapAttribute":"uid"},"id":"ldap-users","name":"ldap-users","rdnLDAPAttribute":"uid","testing":{"admin":{"password":"admin"},"enabled":false,"image":"osixia/openldap","provisioning":{"admin":{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"},"domain":{"extension":"com","name":"nemerosa"},"enabled":true,"organisation":"Ontrack"},"resources":{},"tag":"1.5.0"},"url":"ldap://ldap:389","userObjectClasses":"inetOrgPerson","usernameLDAPAttribute":"uid","usersDn":"ou=users,dc=example,dc=com","uuidLDAPAttribute":"entryUUID"}` | Configuration of Keycloak to use a LDAP for user federation |
| auth.keycloak.ldap.bindCredential | string | `"admin"` | Bind credentials Not recommended in production, better use a secret |
| auth.keycloak.ldap.bindCredentialSecret | object | `{"enabled":false,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}},"secretName":"ontrack-ldap-credentials"}` | Bind credentials in a secret |
| auth.keycloak.ldap.bindCredentialSecret.enabled | bool | `false` | Using a secret to store the credentials |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret | object | `{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}}` | Using an external secret |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.enabled | bool | `false` | Creating the external secret definition |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.refreshInterval | string | `"6h"` | Refresh interval |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.store | object | `{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/ldap"}` | Location of the secret to bind to |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.store.kind | string | `"ClusterSecretStore"` | Scope of the secret store |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.store.name | string | `"vault-backend"` | Name of the secret store |
| auth.keycloak.ldap.bindCredentialSecret.externalSecret.store.path | string | `"ontrack/keycloak/ldap"` | Path to the secret in the store. The entry is expected to have the following keys: bindDn & bindCredential |
| auth.keycloak.ldap.bindCredentialSecret.secretName | string | `"ontrack-ldap-credentials"` | Name of the secret This secret is expected to have the following keys: * bindDn * bindCredential |
| auth.keycloak.ldap.bindDn | string | `"cn=admin,dc=example,dc=com"` | Bind DN Prefer using a secret |
| auth.keycloak.ldap.components | object | `{}` | If defined, provides the _whole_ LDAP configuration in Keycloak (under the `components` node) |
| auth.keycloak.ldap.enabled | bool | `false` | Using a LDAP |
| auth.keycloak.ldap.groups | object | `{"groupNameLdapAttribute":"cn","groupObjectClasses":"groupOfNames","groupsDn":"ou=groups,dc=example,dc=com","memberofLdapAttribute":"memberOf","membershipAttributeType":"DN","membershipLdapAttribute":"member","membershipUserLdapAttribute":"uid"}` | Configuration of the LDAP groups |
| auth.keycloak.ldap.groups.groupsDn | string | `"ou=groups,dc=example,dc=com"` | Groups DN |
| auth.keycloak.ldap.id | string | `"ldap-users"` | ID of the LDAP federation in Keycloak |
| auth.keycloak.ldap.name | string | `"ldap-users"` | Name of the LDAP federation in Keycloak |
| auth.keycloak.ldap.rdnLDAPAttribute | string | `"uid"` | LDAP attributes: DN |
| auth.keycloak.ldap.testing | object | `{"admin":{"password":"admin"},"enabled":false,"image":"osixia/openldap","provisioning":{"admin":{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"},"domain":{"extension":"com","name":"nemerosa"},"enabled":true,"organisation":"Ontrack"},"resources":{},"tag":"1.5.0"}` | Creating a testing LDAP instance |
| auth.keycloak.ldap.testing.admin | object | `{"password":"admin"}` | Admin user |
| auth.keycloak.ldap.testing.admin.password | string | `"admin"` | Its password |
| auth.keycloak.ldap.testing.enabled | bool | `false` | Enabling the creation of the LDAP test instance |
| auth.keycloak.ldap.testing.image | string | `"osixia/openldap"` | Image to be used for the LDAP service |
| auth.keycloak.ldap.testing.provisioning | object | `{"admin":{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"},"domain":{"extension":"com","name":"nemerosa"},"enabled":true,"organisation":"Ontrack"}` | Provisioning of the LDAP |
| auth.keycloak.ldap.testing.provisioning.admin | object | `{"sshaPassword":"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"}` | Admin user |
| auth.keycloak.ldap.testing.provisioning.admin.sshaPassword | string | `"{SSHA}cqhYu0IJNPgwklQuoENm6PtzGJLpPkgt"` | SSHA admin password `slappasswd -h {SSHA} -s admin` |
| auth.keycloak.ldap.testing.provisioning.domain | object | `{"extension":"com","name":"nemerosa"}` | Domain name |
| auth.keycloak.ldap.testing.provisioning.enabled | bool | `true` | Is it enabled? |
| auth.keycloak.ldap.testing.provisioning.organisation | string | `"Ontrack"` | Organization name |
| auth.keycloak.ldap.testing.resources | object | `{}` | Resources to allocate |
| auth.keycloak.ldap.testing.tag | string | `"1.5.0"` | Tag to be used for the LDAP service |
| auth.keycloak.ldap.url | string | `"ldap://ldap:389"` | URL to the ldap |
| auth.keycloak.ldap.userObjectClasses | string | `"inetOrgPerson"` | LDAP attributes: class for the user object |
| auth.keycloak.ldap.usernameLDAPAttribute | string | `"uid"` | LDAP attributes: username |
| auth.keycloak.ldap.usersDn | string | `"ou=users,dc=example,dc=com"` | Users DN |
| auth.keycloak.ldap.uuidLDAPAttribute | string | `"entryUUID"` | LDAP attributes: unique ID |
| auth.keycloak.name | string | `"Yontrack"` | Name to use on the Signin page |
| auth.keycloak.realm | string | `"ontrack"` | Name of the realm to create in Keycloak to serve the Ontrack users |
| auth.keycloak.resources | object | `{}` | Resources to allocate to the local Keycloak instance |
| auth.keycloak.secret | object | `{"enabled":false,"external":{"enabled":false,"refreshInterval":"6h","store":{"key":"client-secret","kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/client"}},"generate":true,"name":"ontrack-keycloak"}` | Connection parameters to Keycloak stored in a secret |
| auth.keycloak.secret.enabled | bool | `false` | Using a secret to store the client secret |
| auth.keycloak.secret.external | object | `{"enabled":false,"refreshInterval":"6h","store":{"key":"client-secret","kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/client"}}` | External secret for the client secret |
| auth.keycloak.secret.external.enabled | bool | `false` | Creating the external secret definition |
| auth.keycloak.secret.external.refreshInterval | string | `"6h"` | Refresh interval |
| auth.keycloak.secret.external.store | object | `{"key":"client-secret","kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/keycloak/client"}` | Location of the secret to bind to |
| auth.keycloak.secret.external.store.kind | string | `"ClusterSecretStore"` | Scope of the secret store |
| auth.keycloak.secret.external.store.name | string | `"vault-backend"` | Name of the secret store |
| auth.keycloak.secret.external.store.path | string | `"ontrack/keycloak/client"` | Path to the secret in the store. The entry is expected to have the following keys: bindDn & bindCredential |
| auth.keycloak.secret.generate | bool | `true` | Generating the client secret |
| auth.keycloak.secret.name | string | `"ontrack-keycloak"` | Name of the secret to use |
| auth.keycloak.service | object | `{"ingressEnabled":true,"path":"keycloak","port":8080}` | Service setup for the local Keycloak instance |
| auth.keycloak.service.ingressEnabled | bool | `true` | Enabling Keycloak in the Ingress |
| auth.keycloak.service.path | string | `"keycloak"` | Relative path for the local Keycloak instance (relatively to the Ontrack main URL) |
| auth.keycloak.service.port | int | `8080` | Port of the service for the local Keycloak instance |
| auth.keycloak.settings | object | `{"accessTokenLifespan":3600,"admin":{"email":"","firstName":"Admin","lastName":"User","password":"admin","username":"admin"},"enabled":true,"registrationAllowed":true,"resetPasswordAllowed":true,"ssoSessionIdleTimeout":3600}` | Provisioning settings |
| auth.keycloak.settings.accessTokenLifespan | int | `3600` | Access Token Lifespan (in seconds) |
| auth.keycloak.settings.admin | object | `{"email":"","firstName":"Admin","lastName":"User","password":"admin","username":"admin"}` | Initial Ontrack user to create |
| auth.keycloak.settings.admin.email | string | `""` | Email If not set, `auth.admin.email` is used |
| auth.keycloak.settings.admin.firstName | string | `"Admin"` | First name |
| auth.keycloak.settings.admin.lastName | string | `"User"` | Last name |
| auth.keycloak.settings.admin.password | string | `"admin"` | Password (would need to be changed) |
| auth.keycloak.settings.admin.username | string | `"admin"` | Username |
| auth.keycloak.settings.enabled | bool | `true` | Provisioning of Keycloak is enabled |
| auth.keycloak.settings.registrationAllowed | bool | `true` | Enabling users to register in the local instance of Keycloak |
| auth.keycloak.settings.resetPasswordAllowed | bool | `true` | Enabling users to reset their passwords |
| auth.keycloak.settings.ssoSessionIdleTimeout | int | `3600` | SSO idle time (in seconds) |
| auth.keycloak.tag | string | `"26.2.5"` | Version this image of Keycloak to deploy |
| auth.keycloak.verbose | bool | `false` | Starting the server in verbose mode |
| auth.next | object | `{"secret":{"generate":true,"name":"ontrack-next-auth"}}` | Unique secret used by Next Auth in Ontrack to create session cookies |
| auth.next.secret | object | `{"generate":true,"name":"ontrack-next-auth"}` | Secret definition |
| auth.next.secret.generate | bool | `true` | Generating the secret |
| auth.next.secret.name | string | `"ontrack-next-auth"` | Name of the secret The secret must have an `secret` entry |
| auth.oidc | object | `{"credentials":{"client":{"clientId":"<client id>","clientSecret":"<client secret>"},"secret":{"enabled":true,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}},"secretName":"ontrack-oidc"}},"enabled":false,"issuer":"","name":"OIDC","trailingSlash":false}` | OIDC configuration (disabled by default) |
| auth.oidc.credentials | object | `{"client":{"clientId":"<client id>","clientSecret":"<client secret>"},"secret":{"enabled":true,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}},"secretName":"ontrack-oidc"}}` | Credentials used to contact the OIDC provider |
| auth.oidc.credentials.client | object | `{"clientId":"<client id>","clientSecret":"<client secret>"}` | ... or provided directly in the values (ok for testing) If a secret (or external secret) is provided, these values are not used |
| auth.oidc.credentials.client.clientId | string | `"<client id>"` | OIDC Client ID |
| auth.oidc.credentials.client.clientSecret | string | `"<client secret>"` | OIDC Client Secret |
| auth.oidc.credentials.secret | object | `{"enabled":true,"externalSecret":{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}},"secretName":"ontrack-oidc"}` | Either stored in a secret (recommended) |
| auth.oidc.credentials.secret.enabled | bool | `true` | Enabling the secret |
| auth.oidc.credentials.secret.externalSecret | object | `{"enabled":false,"refreshInterval":"6h","store":{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}}` | Depending on your setup, you can also just create an external secret definition, pointing to the actual secret in a secret provided like Vault or your cloud secret manager If not using an external secret, Ontrack expects you to create the secret manually. |
| auth.oidc.credentials.secret.externalSecret.enabled | bool | `false` | Enabling the creation of the external secret |
| auth.oidc.credentials.secret.externalSecret.refreshInterval | string | `"6h"` | Refresh interval |
| auth.oidc.credentials.secret.externalSecret.store | object | `{"kind":"ClusterSecretStore","name":"vault-backend","path":"ontrack/oidc"}` | Location of the secret to bind to |
| auth.oidc.credentials.secret.externalSecret.store.kind | string | `"ClusterSecretStore"` | Scope of the secret store |
| auth.oidc.credentials.secret.externalSecret.store.name | string | `"vault-backend"` | Name of the secret store |
| auth.oidc.credentials.secret.externalSecret.store.path | string | `"ontrack/oidc"` | Path to the secret in the store. The entry is expected to have the following keys: clientId & clientSecret |
| auth.oidc.credentials.secret.secretName | string | `"ontrack-oidc"` | The secret is expected to have the following keys: clientId & clientSecret |
| auth.oidc.enabled | bool | `false` | Enabling OIDC authentication |
| auth.oidc.issuer | string | `""` | OIDC issuer URL |
| auth.oidc.name | string | `"OIDC"` | Display name for your IdP (used for the login page) |
| auth.oidc.trailingSlash | bool | `false` | Trailing slash for the issuer URL (used for Auth0) |
| auth.provisioning | bool | `true` | Provisioning of groups & initial administrator |
| elasticsearch | object | `{"antiAffinity":"soft","clusterHealthCheckParams":"wait_for_status=yellow&timeout=1s","enabled":true,"esConfig":{"elasticsearch.yml":"discovery.zen.minimum_master_nodes: 1\nbootstrap.system_call_filter: \"false\"\nnode.max_local_storage_nodes: 8\ncluster.routing.allocation.disk.threshold_enabled: \"false\"\naction.auto_create_index: \".*\"\n# Disabling security warnings\nxpack.security.enabled: \"false\"\n"},"esJavaOpts":"-Xmx512m -Xms512m -XX:-HeapDumpOnOutOfMemoryError","masterService":"ontrack-search","maxUnavailable":0,"minimumMasterNodes":1,"replicas":1,"resources":{"limits":{"memory":"1024M"},"requests":{"cpu":"300m","memory":"1024M"}},"volumeClaimTemplate":{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"5Gi"}}}}` | Local Elasticsearch engine for testing purpose |
| emptyDir | object | `{}` | In case you want to specify different resources for emptyDir than {} |
| extraContainers | list | `[]` | Array of extra containers to run alongside the Ontrack container  Example: - name: myapp-container   image: busybox   command: ['sh', '-c', 'echo Hello && sleep 3600']  |
| fullnameOverride | string | `""` | If defined, uses this name for the resource names instead of the using the chart name |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy |
| image.repository | string | `"nemerosa/ontrack"` | Image to use for Ontrack (backend) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | List of secrets used to pull images |
| ingress.annotations | object | `{}` | Annotations for the Ingress |
| ingress.enabled | bool | `true` | Creating an Ingress for the Ontrack different services. This is required when using Keycloak. |
| ingress.host | string | `"ontrack.local"` | Host for Ontrack |
| ingress.tls.enabled | bool | `true` | Using TLS for Ontrack |
| keycloak-postgresql | object | `{"auth":{"database":"keycloak","password":"keycloak","username":"keycloak"}}` | Local database |
| keycloak-postgresql.auth | object | `{"database":"keycloak","password":"keycloak","username":"keycloak"}` | Authentication parameters |
| keycloak-postgresql.auth.database | string | `"keycloak"` | Name of the database to create |
| keycloak-postgresql.auth.password | string | `"keycloak"` | Credentials to be used |
| keycloak-postgresql.auth.username | string | `"keycloak"` | Credentials to be used |
| management.service.annotations | object | `{}` | Annotations for the management service. Only used when specific == true |
| management.service.port | int | `8800` | Exposed port for the Ontrack management service |
| management.service.specific | bool | `false` | Set to true to have the management port exposed by another Service. By default, using the same service and two different named ports |
| management.service.type | string | `"ClusterIP"` | Service type for the management. Only used when specific == true |
| nameOverride | string | `""` | Name to use instead of the chart name |
| nodeSelector | object | `{}` | Node selectors for the Ontrack resources |
| ontrack.application_yaml | string | `""` | Application configuration file as a YAML content |
| ontrack.casc | object | `{"directory":"/var/ontrack/casc","enabled":false,"map":"","mapValues":{"mapEntryName":"casc.yaml"},"reloading":{"cron":"","enabled":false},"secret":"","secrets":{"directory":"/var/ontrack/casc/mapping","mapping":"env","names":[]},"upload":{"enabled":false}}` | CasC configuration |
| ontrack.casc.directory | string | `"/var/ontrack/casc"` | Path where to mount the Casc files |
| ontrack.casc.enabled | bool | `false` | Is Casc enabled? |
| ontrack.casc.map | string | `""` | Config map containing all Casc files |
| ontrack.casc.mapValues | object | `{"mapEntryName":"casc.yaml"}` | Casc from values |
| ontrack.casc.mapValues.mapEntryName | string | `"casc.yaml"` | Name of the entry to hold the values |
| ontrack.casc.reloading | object | `{"cron":"","enabled":false}` | Auto reload configuration |
| ontrack.casc.reloading.cron | string | `""` | Auto reload cron schedule Leave empty to be a manual job only |
| ontrack.casc.reloading.enabled | bool | `false` | Auto reload activation |
| ontrack.casc.secret | string | `""` | Secret map containing all secret Casc files |
| ontrack.casc.secrets | object | `{"directory":"/var/ontrack/casc/mapping","mapping":"env","names":[]}` | Mapping of secrets |
| ontrack.casc.secrets.directory | string | `"/var/ontrack/casc/mapping"` | Directory where to map the secrets (for mapping = env) |
| ontrack.casc.secrets.mapping | string | `"env"` | Secret mapping mode |
| ontrack.casc.secrets.names | list | `[]` | List of secret names to mount |
| ontrack.casc.upload | object | `{"enabled":false}` | Uploading the Casc |
| ontrack.casc.upload.enabled | bool | `false` | Casc upload activation |
| ontrack.config.key_store | string | `"jdbc"` | Using the database to store the key by default |
| ontrack.config.license.key | string | `"eyJkYXRhIjoiZXlKdVlXMWxJam9pVXlJc0ltRnpjMmxuYm1WbElqb2lVSFZpYkdsaklpd2lkbUZzYVdSVmJuUnBiQ0k2SWpJd01qVXRNVEl0TXpFaUxDSnRZWGhRY205cVpXTjBjeUk2TVRBc0ltWmxZWFIxY21WeklqcGJleUpwWkNJNkltVjRkR1Z1YzJsdmJpNWxiblpwY205dWJXVnVkSE1pTENKbGJtRmliR1ZrSWpwbVlXeHpaU3dpWkdGMFlTSTZXM3NpYm1GdFpTSTZJbTFoZUVWdWRtbHliMjV0Wlc1MGN5SXNJblpoYkhWbElqb2lNQ0o5WFgxZExDSnRaWE56WVdkbElqb2lXVzkxSUdGeVpTQjFjMmx1WnlCaGJpQmxkbUZzZFdGMGFXOXVJR3hwWTJWdWMyVXVJbjA9Iiwic2lnbmF0dXJlIjoiTUVVQ0lFMWNjQWQxT25ZQXl2M3B4c3ZaQWc0eDE1Q3dmY3FjMFNNRm12ZUU5TVRDQWlFQTJJZHVsZEtxek5DU2Q2VHJNNGxsczhzVGlHWXQ3Nmw5bFRZQ3pFdDBKMjQ9In0="` | Provided license key An evaluation key is provided by default (valid until 2025-12-31, up to 10 projects, no extra features) |
| ontrack.config.secret_key_store.directory | string | `"/var/ontrack/key_store"` | Directory to use inside the container |
| ontrack.config.secret_key_store.secret_name | string | `"ontrack-key-store"` | Name of the secret |
| ontrack.env | list | `[]` | Arbitrary environment variables |
| ontrack.extraConfig.configmaps | list | `[]` | Arbitrary config map sources |
| ontrack.extraConfig.secrets | list | `[]` | Arbitrary secrets map sources |
| ontrack.management.metrics.tags.application | string | `"ontrack"` | Application tag to add to all exposed metrics |
| ontrack.management.metrics.tags.application_instance | string | `"ontrack"` | Application instance tag to add to all exposed metrics |
| ontrack.persistence.accessMode | string | `"ReadWriteOnce"` | PVC access mode |
| ontrack.persistence.annotations | object | `{}` | Set annotations on pvc |
| ontrack.persistence.enabled | bool | `true` | Enabling the persistent storage |
| ontrack.persistence.size | string | `"5Gi"` | PVC initial size |
| ontrack.persistence.storageClass | string | `nil` | If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| ontrack.profiles | string | `"prod"` | Comma-separated list of active Spring profiles |
| ontrack.resources.limits.cpu | string | `"800m"` | Ontrack resources |
| ontrack.resources.limits.memory | string | `"2Gi"` | Ontrack resources |
| ontrack.resources.requests.cpu | string | `"800m"` | Ontrack resources |
| ontrack.resources.requests.memory | string | `"1Gi"` | Ontrack resources |
| ontrack.ui.image | string | `"nemerosa/ontrack-ui"` | Image to use for the UI |
| ontrack.ui.replicas | int | `1` | Number of replicas for the UI (experimental) |
| ontrack.ui.resources | object | `{"limits":{"cpu":"800m","memory":"1Gi"},"requests":{"cpu":"800m","memory":"1Gi"}}` | Next UI resources |
| ontrack.ui.resources.limits.cpu | string | `"800m"` | Next UI resources |
| ontrack.ui.resources.limits.memory | string | `"1Gi"` | Next UI resources |
| ontrack.ui.resources.requests.cpu | string | `"800m"` | Next UI resources |
| ontrack.ui.resources.requests.memory | string | `"1Gi"` | Next UI resources |
| ontrack.ui.service.port | int | `3000` | Exposed port for the Ontrack IO |
| ontrack.url | string | `"http://localhost:3000"` | Ontrack root URL - must point to the UI service |
| podAnnotations | object | `{}` | Annotations for all pods |
| podSecurityContext | object | `{}` | Security context for all pods |
| postgresql | object | `{"auth":{"database":"ontrack","password":"ontrack","username":"ontrack"},"local":true,"postgresFromEnv":false,"postgresqlUrl":""}` | Local database |
| postgresql.auth | object | `{"database":"ontrack","password":"ontrack","username":"ontrack"}` | Authentication parameters |
| postgresql.auth.database | string | `"ontrack"` | Name of the database to create |
| postgresql.auth.password | string | `"ontrack"` | Credentials to be used |
| postgresql.auth.username | string | `"ontrack"` | Credentials to be used |
| postgresql.local | bool | `true` | Enabling the local database |
| postgresql.postgresFromEnv | bool | `false` | For external database, using environment variables |
| postgresql.postgresqlUrl | string | `""` | For external database |
| rabbitmq | object | `{"auth":{"erlangCookie":"ontrack","password":"ontrack","username":"ontrack"}}` | Local RabbitMQ for message processing |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` | Security context for the containers |
| service.annotations | object | `{}` | Annotations for the Ontrack service |
| service.port | int | `8080` | Exposed port for the Ontrack service |
| service.type | string | `"ClusterIP"` | Service type for the Ontrack service |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Node tolerations for the Ontrack resources |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
