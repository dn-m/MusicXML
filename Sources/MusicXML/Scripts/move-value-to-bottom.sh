#!/bin/sh
if [[ -n $(gsed -n '/MARK: Value$/ p' "$1") ]] ; then
    gsed -i -r -n '
    /MARK: Value$/,/MARK/ {
        /MARK: Value$/ {
            x
            b
        }
        /Initializers/ {
            x;p;g;p
            b
        }
        /MARK/ !{
            H
            b
        }
        p
        b
    }
    /Initializers/ {
        x;p;g;p
        b
    }
    p
    ' "$1"
fi
