kubectl delete -f gitlab-web.yaml
kubectl delete -f gitlab-service.yaml
kubectl delete -f gitlab-deployment.yaml
kubectl delete -f gitlab-secret.yaml
kubectl delete -f gitlab-config.yaml
rm -rf /home/spring/data/k8s/gitlab/data

kubectl create -f gitlab-config.yaml
kubectl create -f gitlab-secret.yaml
kubectl create -f gitlab-deployment.yaml
kubectl create -f gitlab-service.yaml
kubectl create -f gitlab-web.yaml

# gitlab-runner

kubectl create clusterrolebinding gitlab-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccounts --namespace=gitlab-runner

kubectl --kubeconfig config -n gitlab-runner get pod

kubectl -n aispring exec -it $(kubectl -n aispring get pods | grep gitlab-runner | awk '{print $1}') /bin/sh

kubectl -n aispring exec -it $(kubectl -n aispring get pods | grep gitlab | awk '{print $1}') /bin/sh

gitlab-runner register

https://git.aispring.cloud/

gitlab-runner register \
  --name "shared token" \
  --non-interactive \
  --url "http://git.aispring.cloud/" \
  --tls-ca-file "/etc/gitlab-runner/aispring.cloud-cert/cert.cer" \
  --tls-key-file "/etc/gitlab-runner/aispring.cloud-cert/cert.key" \
  --registration-token "5QdZATg9B8s2Arsk-RyA" \
  --executor "kubernetes" \
  --kubernetes-host "https://192.168.66.201:6443" \
  --kubernetes-cert-file "/etc/gitlab-runner/k8s-cert/apiserver.crt" \
  --kubernetes-key-file "/etc/gitlab-runner/k8s-cert/apiserver.key" \
  --kubernetes-ca-file "/etc/gitlab-runner/k8s-cert/ca.crt" \
  --kubernetes-bearer_token "eyJhbGciOiJSUzI1NiIsImtpZCI6Ilc4NmtwN2JnSlRWNFRaYnR2MjNQVk9MTUtyQ0ZRQkVqSzBNNEFYb2kxWEkifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLWw3aDVkIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI1YWQ5NGY2Yi0xMzcwLTRlZTctOGUzOC1kMDhkMWZlNGZiNTkiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.SALJm7AVNhde3A8gytrlBRTfpv1sZpJgwnzbNDLQn2eC_SEwd0u6MEcnlSoSQ0kxfqwf_X4221SByjio_tCRuaYefUo6HUslTDELycWRq1j5--f3q8DvvVIRcuGDo7iofNIn3tEV32fIJplGrIsm0DXz2TYG66SK4-D1oYP6GwN4JyhtgDh1Rmx7wY6bI9fgOgW7VzuyfEeSiJ-5dZ4aiZ13jDMXwm0fKsHgu0V6xs8KZ1hDPZSOhESbsbROY4v6PoWLiWzjyt4j3Lwh1XmoYs2gUGVxP4DVUTSaAqZNi8vjodM5gR6V6lDQHpwCKPETvjFl-XyTuy7fybMdKbSOTA" \
  --kubernetes-namespace "gitlab-runner"
  --kubernetes-volumes "/home/spring/data/k8s/gitlab-runner/data/.m2:/root/.m2" \
  --kubernetes-volumes "/home/spring/data/k8s/gitlab-runner/data/.npm:/root/.npm" \
  --kubernetes-volumes "/home/spring/data/k8s/gitlab-runner/data/app:/opt/app"
  --kubernetes-volumes "/var/run/docker.sock:/var/run/docker.sock"
