#!/bin/sh
struct=$(gsed -r -n '0,/public struct/ s/public struct (.*) \{/\1/ p' "$1")
if [[ -z $(gsed -n '/DynamicNodeEncoding/ p' "$1") ]] ; then
    if [[ -z $(gsed -n '/import XMLCoder/ p' "$1") ]] ; then
        echo "import XMLCoder" >> "$1"
    fi
    echo "// sourcery:inline:$struct.DynamicNodeEncoding" >> "$1"
    echo "// sourcery:end" >> "$1"
fi
