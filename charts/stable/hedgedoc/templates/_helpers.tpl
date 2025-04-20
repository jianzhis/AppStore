{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "hedgedoc.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "hedgedoc.name" -}}
hedgedoc
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "hedgedoc.labels" -}}
app.kubernetes.io/name: {{ include "hedgedoc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "hedgedoc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hedgedoc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}