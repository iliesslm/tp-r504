#!/bin/bash
tok=$(cat ~/token.gh)
OWNER=iliesslm
REPO=tp-r504

curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts > gh-artifacts.json

jq '.artifacts[].id' gh-artifacts.json > liste-id.txt

for id in $(cat liste-id.txt); do
    echo "téléchargement de l'artifact $id"
    curl -sL \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $tok" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      --output artifact_$id.zip \
      https://api.github.com/repos/$OWNER/$REPO/actions/artifacts/$id/zip
    unzip -o artifact_$id.zip -d artifact_$id
done
