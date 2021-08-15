# 

param (
    $GH_USER,           # ${{ github.actor }}
    $REG_NAME,          # ghcr.io
    $REG_PASS,          # ${{ secrets.GHCR_PAT_TOKEN }}
    $K8S_NAMESPACE      # mini3
)

kubectl create secret docker-registry regcred `
    --docker-server=$REG_NAME `
    --docker-username=$GH_USER `
    --docker-password=$REG_PASS `
    --namespace $K8S_NAMESPACE `
    --dry-run=client --save-config -o yaml `
    | kubectl apply -f -

