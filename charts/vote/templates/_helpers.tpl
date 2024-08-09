{{/*
Expand the name of the chart. This is useful for labeling resources consistently.
*/}}
{{- define "vote.name" -}}
{{ .Release.Name }}-{{ .Values.global.appName }}
{{- end }}

{{/*
Generate a fullname for the resources. This combines the release name, chart name, and application name.
*/}}
{{- define "vote.fullname" -}}
{{ .Release.Name }}-{{ include "vote.name" . }}
{{- end }}

{{/*
Generate labels that are consistent across all resources.
*/}}
{{- define "vote.labels" -}}
app.kubernetes.io/name: {{ include "vote.name" . }}
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
{{- define "vote.selectorLabels" -}}
app: {{ include "vote.name" . }}
{{- end }}
