kubectl delete -f postgresql-service.yaml
kubectl delete -f postgresql-master.yaml
kubectl delete -f postgresql-secret.yaml
rm -rf /home/spring/data/k8s/postgresql/data

kubectl create -f postgresql-secret.yaml
kubectl create -f postgresql-master.yaml
kubectl create -f postgresql-service.yaml
