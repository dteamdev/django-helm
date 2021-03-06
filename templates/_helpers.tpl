{{/*
Expand the name of the chart.
*/}}
{{- define "django-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "django-helm.fullname" -}}
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
{{- define "django-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "django-helm.labels" -}}
helm.sh/chart: {{ include "django-helm.chart" . }}
{{ include "django-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "django-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "django-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "django-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "django-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the imagePullSecretsName to use
*/}}
{{- define "django-helm.imagePullSecretsName" -}}
{{- default (printf "%s-imagepullsecrets" (include "django-helm.fullname" .)) .Values.imagePullSecrets.name }}
{{- end }}

{{/*
Create the name of the configMap to use
*/}}
{{- define "django-helm.configMapName" -}}
{{- default (printf "%s-configmap" (include "django-helm.fullname" .)) .Values.configMap.name }}
{{- end }}

{{/*
Create the name of the configMap to use
*/}}
{{- define "django-helm.secretConfigName" -}}
{{- default (printf "%s-secretconfig" (include "django-helm.fullname" .)) .Values.secretConfig.name }}
{{- end }}
