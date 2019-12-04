#!/bin/sh
if [[ -n $(gsed -n '/MARK: Kind$/ p' "$1") ]] ; then
    gsed -i -r -n '
    /MARK: Kind$/,/MARK/ {
        /MARK: Kind$/ {
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
