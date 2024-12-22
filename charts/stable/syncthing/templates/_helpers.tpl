{{/* 
Generate the full name of the release, limiting to 63 characters 
*/}}
{{- define "syncthing.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* 
Generate the name of the chart 
*/}}
{{- define "syncthing.name" -}}
syncthing
{{- end -}}

{{/* 
Generate common labels 
*/}}
{{- define "syncthing.labels" -}}
app.kubernetes.io/name: {{ include "syncthing.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "syncthing.selectorLabels" -}}
app.kubernetes.io/name: {{ include "syncthing.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}