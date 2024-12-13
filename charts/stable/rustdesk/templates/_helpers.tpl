{{/*
Generate the fullname of the release, limiting to 63 characters
*/}}
{{- define "rustdesk-server.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name of the chart
*/}}
{{- define "rustdesk-server.name" -}}
rustdesk-server
{{- end -}}

{{/*
Generate common labels for the chart
*/}}
{{- define "rustdesk-server.labels" -}}
app.kubernetes.io/name: {{ include "rustdesk-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
createdBy: "Apps"
{{- end -}}