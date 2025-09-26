#!/bin/sh
set -e

# Create kube directory
mkdir -p ~/.kube

# Write KUBECONFIG_JSON to config file
echo "$KUBECONFIG_JSON" > ~/.kube/config

# Switch context and namespace if provided
if [ -n "$K8S_CONTEXT" ]; then
  kubectl config use-context "$K8S_CONTEXT"
fi

if [ -n "$K8S_NAMESPACE" ]; then
  kubectl config set-context --current --namespace="$K8S_NAMESPACE"
fi

exec "$@"

