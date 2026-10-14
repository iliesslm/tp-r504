#!/bin/bash
tok=$(cat ~/token.gh)
OWNER=iliesslm
REPO=tp-r504

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts > gh-artifacts.json

ID=$(jq '[.artifacts[] | select(.name=="graphes-svg")][0].id' gh-artifacts.json)
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  --output artifact.zip \
  https://api.github.com/repos/$OWNER/$REPO/actions/artifacts/$ID/zip
unzip -o artifact.zip
