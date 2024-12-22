{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "code-server.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "code-server.name" -}}
code-server
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "code-server.labels" -}}
app.kubernetes.io/name: {{ include "code-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "code-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "code-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}