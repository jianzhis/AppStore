{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "lsky-pro.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "lsky-pro.name" -}}
lsky-pro
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "lsky-pro.labels" -}}
app.kubernetes.io/name: {{ include "lsky-pro.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "lsky-pro.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lsky-pro.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}