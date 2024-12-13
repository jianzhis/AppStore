{{/*
Generate the full name of the release, limiting to 63 characters
*/}}
{{- define "awvs.fullname" -}}
{{- printf "%s-%s" .Release.Name "awvs" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate the name of the chart
*/}}
{{- define "awvs.name" -}}
awvs
{{- end -}}

{{/*
Generate common labels for the chart
*/}}
{{- define "awvs.labels" -}}
app.kubernetes.io/name: {{ include "awvs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}