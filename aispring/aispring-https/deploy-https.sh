kubectl -n aispring create secret generic local-aispring-https-certs --from-file=tls.key --from-file=tls.crt  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n aispring get secret local-aispring-https-certs -o yaml