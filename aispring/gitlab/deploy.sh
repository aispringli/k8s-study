

# 创建用户和数据库

drop database gitlab;

drop user gitlab;

create user gitlab password '123456' superuser createrole createdb;

grant postgres to gitlab ;

# create database gitlab owner gitlab;

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
  --tls-ca-file "/etc/gitlab-runner/aispring.cloud-cert/tls.crt" \
  --tls-key-file "/etc/gitlab-runner/aispring.cloud-cert/tls.key" \
  --registration-token "6aVqHLveyi3SHrf-rYFL" \
  --executor "kubernetes" \
  --kubernetes-host "https://192.168.66.231:6443" \
  --kubernetes-cert-file "/etc/gitlab-runner/k8s-cert/apiserver.crt" \
  --kubernetes-key-file "/etc/gitlab-runner/k8s-cert/apiserver.key" \
  --kubernetes-ca-file "/etc/gitlab-runner/k8s-cert/ca.crt" \
  --kubernetes-bearer_token "eyJhbGciOiJSUzI1NiIsImtpZCI6IjU2Tzg4RjdhZlFWQkpWbjFqZUJVUmVjZXI5MmthM3Y0cVAzTy1KV0h0ZFUifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXM0Z210Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI5YzMyZTVmZS02MTdiLTQyOWMtODhhOS1hNTc2NWM4YjFmYmYiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.tFMxHNvOsG3PM4618X1TPKUcOtuEXFjf_VIz77hm_5CcxQpDdXk-lHFhnVnenVe_myRvkdaRQPTvyvbMol4DTrXXMBvfNovLSA36hKCUV60t8w_j5dP4L3rhTYFkpTjztveRb2BNLOOnfwYqRS1UhbRsbdyhhQ-cwFVJH5ackwNdtMtfEK0vtE20O3cbhNUMsDZzF8Tz1SkrHHofjCi7mTZY6lo5frtwELg3Cqd4WojFqfch9JLxjgwQQBvke0ZE" \
  --kubernetes-namespace "gitlab-runner"
