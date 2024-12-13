{{/* 
Generate the fullname of the release
Usage: {{ include "hexo.fullname" . }}
*/}}
{{- define "hexo.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* 
Generate the name of the chart
Usage: {{ include "hexo.name" . }}
*/}}
{{- define "hexo.name" -}}
hexo
{{- end }}

{{/* 
Generate common labels
Usage: {{ include "hexo.labels" . }}
*/}}
{{- define "hexo.labels" -}}
app.kubernetes.io/name: {{ include "hexo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}