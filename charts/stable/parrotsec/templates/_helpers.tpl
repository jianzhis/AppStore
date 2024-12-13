{{- define "pentest.name" -}}
pentest
{{- end -}}

{{- define "pentest.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pentest.labels" -}}
app.kubernetes.io/name: {{ include "pentest.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "pentest.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pentest.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}