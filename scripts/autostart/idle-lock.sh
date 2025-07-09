#!/usr/bin/env bash

# Only run hyprlock if not already locked
pgrep -x hyprlock > /dev/null || hyprlock
