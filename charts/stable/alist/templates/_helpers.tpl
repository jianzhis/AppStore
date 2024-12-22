{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "alist.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "alist.name" -}}
alist
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "alist.labels" -}}
app.kubernetes.io/name: {{ include "alist.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "alist.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alist.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}