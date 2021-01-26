#!/bin/sh

gsed -i -r '/DynamicNodeEncoding/,/^\}/ {
:collapse
/case/ {
    N
    /.*attribute/ {
    N
    /case/ {
    N
    /.*attribute/ {
    s/(.*)(:.*case )(.*)/\1, \3/
    t collapse
}
}
}
}
}' "$1"
