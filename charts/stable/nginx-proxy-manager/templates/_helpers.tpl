{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "nginx-proxy-manager.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "nginx-proxy-manager.name" -}}
nginx-proxy-manager
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "nginx-proxy-manager.labels" -}}
app.kubernetes.io/name: {{ include "nginx-proxy-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nginx-proxy-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx-proxy-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}