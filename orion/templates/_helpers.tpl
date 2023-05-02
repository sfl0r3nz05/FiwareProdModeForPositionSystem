{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "orion.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "orion.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orion.fullname" -}}
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
Common labels
*/}}
{{- define "orion.labels" -}}
helm.sh/chart: {{ include "orion.chart" . }}
{{ include "orion.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "orion.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orion.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Mongo Express
*/}}
{{- define "orion.mongoexpress.name" -}}
{{- include "orion.name" . -}}-mongoexpress
{{- end -}}

{{- define "orion.mongoexpress.fullname" -}}
{{- include "orion.fullname" . -}}-mongoexpress
{{- end -}}

{{- define "orion.mongoexpress.labels" -}}
{{ include "orion.labels" . }}
app.kubernetes.io/component: mongoexpress
{{- end -}}

{{- define "orion.mongoexpress.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orion.mongoexpress.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: mongoexpress
{{- end -}}

{{/*
Broker
*/}}
{{- define "orion.broker.name" -}}
{{- include "orion.name" . -}}-broker
{{- end -}}

{{- define "orion.broker.fullname" -}}
{{- include "orion.fullname" . -}}-broker
{{- end -}}

{{- define "orion.broker.labels" -}}
{{ include "orion.labels" . }}
app.kubernetes.io/component: broker
{{- end -}}

{{- define "orion.broker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orion.broker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: broker
{{- end -}}
