{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "drawio.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "drawio.name" -}}
drawio
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "drawio.labels" -}}
app.kubernetes.io/name: {{ include "drawio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "drawio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "drawio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}