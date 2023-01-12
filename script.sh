git checkout -b 'update'
yq -i ".landscapes.add='new'" .argocd/values.yml
git add .
git commit -m 'test'
