{{/*
Generate the fullname of the release, limiting to 63 characters
*/}}
{{- define "pgadmin.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name of the chart
*/}}
{{- define "pgadmin.name" -}}
pgadmin
{{- end -}}

{{/*
Generate common labels for the chart
*/}}
{{- define "pgadmin.labels" -}}
app.kubernetes.io/name: {{ include "pgadmin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{- end -}}