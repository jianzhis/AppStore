{{/*
Expand the name of the chart.
*/}}
{{- define "filebrowser.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "filebrowser.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "filebrowser.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "filebrowser.labels" -}}
helm.sh/chart: {{ include "filebrowser.chart" . }}
{{ include "filebrowser.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "filebrowser.selectorLabels" -}}
app.kubernetes.io/name: {{ include "filebrowser.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}