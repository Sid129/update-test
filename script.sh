git config --global user.email "sachinuppar129@gmail.com"
  git config --global user.name "Sidd"
git checkout -b 'update'
yq -i ".landscapes.add='new'" ./argocd/values.yml
git add .
git commit -m 'test'
owner=$(basename $(dirname $repo_url))
repo=$(basename $repo_url)
curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$owner/$repo/releases \
  -d '{"title":"Amazing new feature","body":"Please pull these awesome changes in!","head":"octocat:new-feature","base":"main"}'
