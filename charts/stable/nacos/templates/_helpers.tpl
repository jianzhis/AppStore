{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "nacos.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "nacos.name" -}}
nacos
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "nacos.labels" -}}
app.kubernetes.io/name: {{ include "nacos.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nacos.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nacos.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}