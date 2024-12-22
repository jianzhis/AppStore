{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "memos.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "memos.name" -}}
memos
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "memos.labels" -}}
app.kubernetes.io/name: {{ include "memos.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "memos.selectorLabels" -}}
app.kubernetes.io/name: {{ include "memos.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}