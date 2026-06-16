#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/.env"
cd "$SCRIPT_DIR"

git add .
git diff --cached --quiet && echo "変更なし。スキップします。" && exit 0
git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
git push https://${GITHUB_TOKEN}@github.com/TuneD-inc/tuned-hp.git main
echo "✅ デプロイ完了！Netlifyが自動で反映します。"
