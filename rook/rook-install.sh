1. kubectl create -f common.yaml

安装operator
2. kubectl create -f operator.yaml

安装 cluster
3. kubectl create -f cluster-test.yaml

安装客户端 Web
4. kubectl apply -f dashboard-external-http.yaml

查看密码
5. kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo
