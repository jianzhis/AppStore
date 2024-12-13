{{- define "ubuntu-ssh.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 32 | trimSuffix "-" }}
{{- end }}

{{- define "ubuntu-ssh.fullname" -}}
{{- .Release.Name | trunc 32 | trimSuffix "-" -}}
{{- end }}

{{- define "ubuntu-ssh.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "ubuntu-ssh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}

{{- define "ubuntu-ssh.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ubuntu-ssh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}