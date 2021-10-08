export POD_NAME=$(kubectl get pods --namespace nexus -l "app.kubernetes.io/component=nexus-master" -l "app.kubernetes.io/instance=nexus" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace nexus port-forward $POD_NAME 3001:8081
