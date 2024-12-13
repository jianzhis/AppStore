{{/*
Generate the fullname of the release, limiting to 63 characters
*/}}
{{- define "open-webui.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name of the chart
*/}}
{{- define "open-webui.name" -}}
open-webui
{{- end -}}

{{/*
Generate common labels for the chart
*/}}
{{- define "open-webui.labels" -}}
app.kubernetes.io/name: {{ include "open-webui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
createdBy: "{{ .Values.labels.createdBy }}"
{{- end -}}