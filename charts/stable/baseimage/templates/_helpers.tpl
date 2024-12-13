{{- define "baseimage.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "baseimage.name" -}}
baseimage
{{- end -}}

{{- define "baseimage.labels" -}}
app.kubernetes.io/name: {{ include "baseimage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "baseimage.selectorLabels" -}}
app.kubernetes.io/name: {{ include "baseimage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}