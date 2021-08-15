# docker login to container registry:

param (
    $GH_USER,   # ${{ github.actor }}
    $REG_NAME,  # ghrc.io
    $REG_PASS   # ${{ secrets.GHCR_PAT_TOKEN }} | $(cat secrets/container-pat.token)
)

echo $REG_PASS | docker login $REG_NAME -u $GH_USER --password-stdin
