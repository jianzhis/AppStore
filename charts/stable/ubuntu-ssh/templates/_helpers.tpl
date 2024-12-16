{{- define "ubuntu-ssh.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "ubuntu-ssh.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ubuntu-ssh.labels" -}}
app.kubernetes.io/name: {{ include "ubuntu-ssh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "ubuntu-ssh.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ubuntu-ssh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
