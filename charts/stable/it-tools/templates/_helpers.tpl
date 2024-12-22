{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "it-tools.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "it-tools.name" -}}
it-tools
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "it-tools.labels" -}}
app.kubernetes.io/name: {{ include "it-tools.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "it-tools.selectorLabels" -}}
app.kubernetes.io/name: {{ include "it-tools.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}