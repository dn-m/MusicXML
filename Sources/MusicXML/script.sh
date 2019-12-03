#!/bin/sh
if [[ -n $(grep 'Instance Propertiea' "$1") ]]; then
    gsed -i '/public struct/ a\
    // MARK: - Instance Properties\n' "$1"
fi
