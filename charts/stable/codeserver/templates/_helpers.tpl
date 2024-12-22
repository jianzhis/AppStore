{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "codeserver.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "codeserver.name" -}}
codeserver
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "codeserver.labels" -}}
app.kubernetes.io/name: {{ include "codeserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "codeserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "codeserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}