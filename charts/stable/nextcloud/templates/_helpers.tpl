{{/*
Generate the fullname of the release, limiting to 63 characters
*/}}
{{- define "nextcloud.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name of the chart
*/}}
{{- define "nextcloud.name" -}}
nextcloud
{{- end -}}

{{/*
Generate common labels for the chart
*/}}
{{- define "nextcloud.labels" -}}
app.kubernetes.io/name: {{ include "nextcloud.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
createdBy: "Apps"
{{- end -}}