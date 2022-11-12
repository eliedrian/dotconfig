#!/usr/bin/env bash
# `jq -e` will exit with exitcode=1 if final value is false.
if swaymsg -t get_outputs -r | jq -e '.[] .dpms' ; then {
    swaymsg "output * dpms off"
} else {
    swaymsg "output * dpms on"
}
fi
