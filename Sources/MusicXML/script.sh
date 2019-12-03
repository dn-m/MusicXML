#!/bin/sh
if [[ -z $(grep 'Instance Propertiea' "$1") ]]; then
    gsed -i '/public struct/ a_// MARK: - Instance Properties\n_' "$1"
fi
