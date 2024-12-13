{{- define "kali.name" -}}
kali
{{- end -}}

{{- define "kali.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kali.labels" -}}
app.kubernetes.io/name: {{ include "kali.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "kali.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kali.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}