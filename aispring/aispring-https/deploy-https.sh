kubectl -n aispring create secret generic aispring-https-certs --from-file=tls.key --from-file=tls.crt

kubectl -n aispring create secret generic aispring-https-certs --from-file=tls.key --from-file=tls.crt  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n aispring get secret aispring-https-certs -o yaml