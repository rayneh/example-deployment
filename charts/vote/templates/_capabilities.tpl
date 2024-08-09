{{/*
Check if the Ingress API is available in the current Kubernetes cluster.
*/}}
{{- define "vote.hasIngress" -}}
{{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
true
{{- else -}}
false
{{- end -}}
{{- end }}

{{/*
Check if the PodDisruptionBudget API is available.
*/}}
{{- define "vote.hasPodDisruptionBudget" -}}
{{- if .Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget" -}}
true
{{- else -}}
false
{{- end -}}
{{- end }}
