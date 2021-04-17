kubectl create -f https://raw.githubusercontent.com/rook/rook/release-1.3/cluster/examples/kubernetes/ceph/common.yaml

kubectl create -f common.yaml

# kubectl create -f pool-test.yaml

kubectl create -f https://raw.githubusercontent.com/rook/rook/release-1.3/cluster/examples/kubernetes/ceph/operator.yaml

kubectl create -f operator.yaml

kubectl apply -f cluster-test.yaml

kubectl apply -f dashboard-external-http.yaml

kubectl get secrets -n rook-ceph rook-ceph-dashboard-password -o jsonpath='{.data.password}' | base64 -d

kubectl -n rook-ceph get pod -o wide

kubectl -n rook-ceph get service

kubectl delete -f dashboard-external-https.yaml

kubectl delete -f dashboard-external-http.yaml

kubectl delete -f cluster-test.yaml

kubectl delete -f operator.yaml

kubectl delete -f common.yaml

kubectl delete namespace rook-ceph

/i/data/rook/config

/j/rook/ceph

UcvCGORA4S

kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') bash

kubeadm reset

kubeadm config images pull

sudo kubeadm init --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.18.4 --pod-network-cidr=10.240.0.0/16

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

sudo mount /dev/sdb /home/sdb

kubectl create -f https://raw.githubusercontent.com/rook/rook/release-1.3/cluster/examples/kubernetes/ceph/toolbox.yaml

kubectl -n rook-ceph get pod -l "app=rook-ceph-tools"

kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') bash

ceph status
ceph osd status
ceph df
rados df
使用完工具箱后，可以删除部署：

kubectl -n rook-ceph delete deployment rook-ceph-tools

for CRD in $(kubectl get crd -n rook-ceph | awk '/ceph.rook.io/ {print $1}'); do kubectl patch crd -n rook-ceph $CRD --type merge -p '{"metadata":{"finalizers": [null]}}'; done

kubectl patch crd -n rook-ceph $CRD --type merge -p '{"metadata":{"finalizers": [null]}}'

swapoff -a

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl taint nodes --all node.kubernetes.io/memory-pressure-

kubectl -n rook-ceph delete cephcluster rook-ceph

kubectl -n rook-ceph patch crd cephclusters.ceph.rook.io --type merge -p '{"metadata":{"finalizers": [null]}}'

kubectl -n rook-ceph delete pod rook-discover-6c6wx --force --grace-period=0

sudo mkfs -t ext4 /dev/sda

sudo mount -t ext4 /dev/sda1 /home/spring/data

ls -l /dev/disk/by-uuid/

sudo blkid /dev/sda1

/dev/disk/by-uuid/14957be2-312f-4e3d-9030-23e919b7eaf1 /home/spring/data ext4 defaults 0 0

kubectl exec -ti gitlab-6985b874bd-vsq6d -n aispring -- /bin/sh

cat /etc/resolv.conf

systemctl status kubelet

Dismount-VMHostAssignableDevice –Force –LocetionPath "Bus Number 3, Target Id 0, LUN 0"
Add-VMAssignableDevice –VMName "Ubuntu20-Server-Pro" –LocationPath "Bus Number 3, Target Id 0, LUN 0"

kubectl taint nodes --all node.kubernetes.io/memory-pressure-

kubectl taint nodes --all node.kubernetes.io/memory-pressure


 cat /dev/zero > /dev/sdb
 
LC.^\,*,)bkP$&v8%QPC

kubectl -n aispring  get pods | grep Evicted |awk '{print$1}'|xargs kubectl -n aispring delete pods