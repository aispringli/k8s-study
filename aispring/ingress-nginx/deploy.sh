docker pull us.gcr.io/k8s-artifacts-prod/ingress-nginx/controller:v0.34.0


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/deploy.yaml

原端口是随机的，需指定80和443端口