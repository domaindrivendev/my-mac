#!/usr/bin/env bash
set -euo pipefail

spec="$1"

current_pane_json=$(herdr pane current)
current_tab_id=$(printf '%s\n' "$current_pane_json" | jq -r '.result.pane.tab_id')

all_panes_json=$(herdr pane list)
target_pane_id=$(printf '%s\n' "$all_panes_json" \
  | jq -r --arg tab "$current_tab_id" \
    '.result.panes[] | select(.tab_id == $tab) | .pane_id' \
  | sed -n '2p')

herdr pane run "$target_pane_id" "bundle exec rspec ${spec}"
