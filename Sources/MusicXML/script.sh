#!/bin/sh
if [[ -z $(grep 'Instance Properties' "$1") ]] ; then
    gsed -i -e '/public struct/ a\
    // MARK: - Instance Properties\n' "$1"
fi
