#!/bin/sh
gsed -i -r -n '
/MARK: Elements/,/MARK/ {
    /MARK: Elements/ {
        x
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
