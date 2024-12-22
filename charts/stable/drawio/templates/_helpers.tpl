{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "niehaohan.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "niehaohan.name" -}}
niehaohan
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "niehaohan.labels" -}}
app.kubernetes.io/name: {{ include "niehaohan.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "niehaohan.selectorLabels" -}}
app.kubernetes.io/name: {{ include "niehaohan.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}