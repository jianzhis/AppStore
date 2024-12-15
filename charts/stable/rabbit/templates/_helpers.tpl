{{- define "rabbit.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rabbit.labels" -}}
app.kubernetes.io/name: {{ include "rabbit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "rabbit.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "rabbit.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rabbit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "rabbit.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rabbit.fullname" .) .Values.serviceAccount.name }}
{{- else }}
""
{{- end -}}
{{- end -}}

{{- define "rabbit.configmapName" -}}
{{- include "rabbit.fullname" . }}-configmap
{{- end -}}

{{- define "rabbit.pvcName" -}}
{{- include "rabbit.fullname" . }}-pvc
{{- end -}}

{{- define "rabbit.serviceName" -}}
{{- include "rabbit.fullname" . }}-service
{{- end -}}
