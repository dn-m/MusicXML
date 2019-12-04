#!/bin/sh
if [[ -n $(gsed -n '/MARK: Elements$/ p' "$1") ]] ; then
    gsed -i -r -n '
    /MARK: Elements$/,/MARK/ {
        /MARK: Elements$/ {
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
