{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "node-red.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "node-red.name" -}}
node-red
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "node-red.labels" -}}
app.kubernetes.io/name: {{ include "node-red.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "node-red.selectorLabels" -}}
app.kubernetes.io/name: {{ include "node-red.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}