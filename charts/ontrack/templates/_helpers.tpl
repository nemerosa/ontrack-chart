{{/*
Expand the name of the chart.
*/}}
{{- define "ontrack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ontrack.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ontrack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ontrack.labels" -}}
helm.sh/chart: {{ include "ontrack.chart" . }}
{{ include "ontrack.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for mgt server
*/}}
{{- define "ontrack.labels.mgt" -}}
helm.sh/chart: {{ include "ontrack.chart" . }}
{{ include "ontrack.selectorLabels.mgt" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for UI
*/}}
{{- define "ontrack.labels.ui" -}}
helm.sh/chart: {{ include "ontrack.chart" . }}
{{ include "ontrack.selectorLabels.ui" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ontrack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ontrack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for the mgt server
*/}}
{{- define "ontrack.selectorLabels.mgt" -}}
app.kubernetes.io/name: {{ include "ontrack.name" . }}-mgt
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for UI
*/}}
{{- define "ontrack.selectorLabels.ui" -}}
app.kubernetes.io/name: {{ include "ontrack.name" . }}-ui
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ontrack.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ontrack.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
