{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "terraria.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "terraria.name" -}}
terraria
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "terraria.labels" -}}
app.kubernetes.io/name: {{ include "terraria.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "terraria.selectorLabels" -}}
app.kubernetes.io/name: {{ include "terraria.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}