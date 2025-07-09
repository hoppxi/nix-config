#!/usr/bin/env bash

set -euo pipefail

# Put the shell and all its children into its own process group
# so that we can kill the entire group later.
trap 'kill 0' SIGINT SIGTERM EXIT

# PID file to track this script's PID
PID_FILE="/tmp/nix-updater.pid"
echo $$ > "$PID_FILE"
trap 'rm -f "$PID_FILE"' EXIT

REBUILD=false
COMMIT=false
PUSH=false

notify() {
  notify-send --urgency="${3:-normal}" "$1" "$2"
}

notify_persistent() {
  notify-send --urgency=normal --hint=int:transient:1 --expire-time=0 "$1" "$2"
}

trap 'notify "Script Failed" "Error at line $LINENO" critical; exit 1' ERR
trap 'notify "Script Interrupted" "Cancelled by user" critical; exit 130' SIGINT

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --rebuild|-r) REBUILD=true ;;
        --commit|-c)  COMMIT=true ;;
        --push|-p)    PUSH=true ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done

HOSTNAME=$(hostname)
FLAKE_DIR="$HOME/nix-config"
FLAKE_REF="$FLAKE_DIR#$HOSTNAME"

echo "[INFO] Updating flake.lock..."
notify_persistent "Nix Workflow" "Updating flake.lock..."
sudo nix flake update --flake "$FLAKE_DIR"
notify "Flake Update Complete" "flake.lock updated for $HOSTNAME"

if $REBUILD; then
    echo "[INFO] Rebuilding system..."
    notify_persistent "Nix Workflow" "Rebuilding system..."
    sudo nixos-rebuild switch --flake "$FLAKE_REF" --show-trace
    notify "Rebuild Complete" "System rebuilt successfully"
fi

if $COMMIT; then
    echo "[INFO] Committing flake.lock..."
    notify_persistent "Nix Workflow" "Committing flake.lock..."
    git -C "$FLAKE_DIR" add flake.lock
    git -C "$FLAKE_DIR" commit -m "update: flake.lock"
    notify "Commit Complete" "flake.lock committed"
fi

if $PUSH; then
    echo "[INFO] Pushing to origin/main..."
    notify_persistent "Nix Workflow" "Pushing to origin/main..."
    git -C "$FLAKE_DIR" push origin main
    notify "Push Complete" "Changes pushed to origin/main"
fi

echo "[OK] Done."
notify "Nix Workflow Complete" "All tasks finished"
