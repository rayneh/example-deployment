{{/*
Expand the name of the chart. This is useful for labeling resources consistently.
*/}}
{{- define "postgres.name" -}}
{{ .Release.Name }}-{{ .Values.global.appName }}
{{- end }}

{{/*
Generate a fullname for the resources. This combines the release name, chart name, and application name.
*/}}
{{- define "postgres.fullname" -}}
{{ .Release.Name }}-{{ include "postgres.name" . }}
{{- end }}

{{/*
Generate labels that are consistent across all resources.
*/}}
{{- define "postgres.labels" -}}
app.kubernetes.io/name: {{ include "postgres.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Chart.Name }}
helm.sh/chart: {{ . | replace "+" "_" }}
{{- end }}
{{- end }}

{{/*
Create a default selector based on the app label.
*/}}
{{- define "postgres.selectorLabels" -}}
app: {{ include "postgres.name" . }}
{{- end }}
