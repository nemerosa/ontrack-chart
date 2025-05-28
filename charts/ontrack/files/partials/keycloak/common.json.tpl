"id": "{{ .Values.auth.keycloak.realm }}",
"realm": "{{ .Values.auth.keycloak.realm }}",
"enabled": true,
"registrationAllowed": {{ .Values.auth.keycloak.settings.registrationAllowed }},
"resetPasswordAllowed": {{ .Values.auth.keycloak.settings.resetPasswordAllowed }},
"ssoSessionIdleTimeout": {{ .Values.auth.keycloak.settings.ssoSessionIdleTimeout }},
"accessTokenLifespan": {{ .Values.auth.keycloak.settings.accessTokenLifespan }},
"users": [
    {
      "username": "{{ .Values.auth.keycloak.settings.admin.username }}",
      "enabled": true,
      "email": "{{ .Values.auth.keycloak.settings.admin.email | default .Values.auth.admin.email }}",
      "firstName": "{{ .Values.auth.keycloak.settings.admin.firstName }}",
      "lastName": "{{ .Values.auth.keycloak.settings.admin.lastName }}",
      "emailVerified": true,
      "credentials": [
        {
          "type": "password",
          "value": "{{ .Values.auth.keycloak.settings.admin.password }}"
        }
      ]
    }
],
"clients": [
    {
      "clientId": "{{ .Values.auth.keycloak.client.id }}",
      "enabled": true,
      "protocol": "openid-connect",
      "publicClient": false,
      "baseUrl": "{{ .Values.ontrack.url }}",
      "redirectUris": [
        "{{ .Values.ontrack.url }}/api/auth/callback/keycloak"
      ],
      "webOrigins": [
        "{{ .Values.ontrack.url }}"
      ],
      "directAccessGrantsEnabled": true,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": false,
      "serviceAccountsEnabled": false,
      "authorizationServicesEnabled": false,
      "clientAuthenticatorType": "client-secret",
      "secret": "{{ .Values.auth.keycloak.client.secret }}",
      "defaultClientScopes": [
        "web-origins",
        "acr",
        "roles",
        "profile",
        "groups",
        "basic",
        "email"
      ]
    }
]