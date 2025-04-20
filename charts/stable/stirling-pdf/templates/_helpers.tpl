{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "stirling-pdf.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "stirling-pdf.name" -}}
stirling-pdf
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "stirling-pdf.labels" -}}
app.kubernetes.io/name: {{ include "stirling-pdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "stirling-pdf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stirling-pdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}