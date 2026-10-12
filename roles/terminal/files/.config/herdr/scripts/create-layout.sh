#!/usr/bin/env bash
set -euo pipefail

# dev tab
dev=$(herdr tab create --label dev --no-focus)
editor_pane=$(printf '%s\n' "$dev" | jq -r '.result.root_pane.pane_id')
herdr pane run "$editor_pane" "vim"

shell=$(herdr pane split "$editor_pane" --direction right --no-focus)

# agents tab
workspace=$(herdr workspace get "$HERDR_WORKSPACE_ID")
workspace_name=$(printf '%s\n' "$workspace" | jq -r '.result.workspace.label')

agents=$(herdr tab create --label agents --no-focus)
builder_pane=$(printf '%s\n' "$agents" | jq -r '.result.root_pane.pane_id')
herdr pane wait-output "$builder_pane" --regex '\>\>' --timeout 10000 > /dev/null
herdr agent start "$workspace_name-builder" --kind grok --pane "$builder_pane"

review=$(herdr pane split "$builder_pane" --direction right --no-focus)
review_pane=$(printf '%s\n' "$review" | jq -r '.result.pane.pane_id')
herdr pane wait-output "$review_pane" --regex '\>\>' --timeout 10000 > /dev/null
herdr agent start "$workspace_name-reviewer" --kind grok --pane "$review_pane"

# dev server tab
dev_server=$(herdr tab create --label dev-server --no-focus)
dev_server_pane=$(printf '%s\n' "$dev_server" | jq -r '.result.root_pane.pane_id')
