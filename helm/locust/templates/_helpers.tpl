{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "locust.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "locust.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "locust.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "locust.version" -}}
{{- if .Values.appVersionOverride -}}
{{- .Values.appVersionOverride -}}
{{- else -}}
{{- .Chart.AppVersion -}}
{{- end -}}
{{- end -}}

{{/*
Master common labels
*/}}
{{- define "locust.master.labels" -}}
helm.sh/chart: {{ include "locust.chart" . }}
{{ include "locust.master.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Master selector labels
*/}}
{{- define "locust.master.selectorLabels" -}}
app.kubernetes.io/name: {{ include "locust.name" . }}-master
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Slave common labels
*/}}
{{- define "locust.slave.labels" -}}
helm.sh/chart: {{ include "locust.chart" . }}
{{ include "locust.slave.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Slave selector labels
*/}}
{{- define "locust.slave.selectorLabels" -}}
app.kubernetes.io/name: {{ include "locust.name" . }}-slave
app.kubernetes.io/instance: {{ .Release.Name }}-slave
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "locust.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "locust.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
