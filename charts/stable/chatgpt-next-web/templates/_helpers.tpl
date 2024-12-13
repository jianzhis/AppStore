{{- define "chatgpt-next-web.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chatgpt-next-web.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chatgpt-next-web.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{ include "chatgpt-next-web.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "chatgpt-next-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chatgpt-next-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}