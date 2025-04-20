{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "photoprism.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "photoprism.name" -}}
photoprism
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "photoprism.labels" -}}
app.kubernetes.io/name: {{ include "photoprism.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "photoprism.selectorLabels" -}}
app.kubernetes.io/name: {{ include "photoprism.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}