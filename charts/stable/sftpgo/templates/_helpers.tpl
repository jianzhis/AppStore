{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "sftpgo.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "sftpgo.name" -}}
sftpgo
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "sftpgo.labels" -}}
app.kubernetes.io/name: {{ include "sftpgo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "sftpgo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sftpgo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}