#!/bin/sh
gsed -i -r '/sourcery:.*DynamicNodeEncoding/,/sourcery:end/ {
/sourcery:.*DynamicNodeEncoding/ {
    d
}
/sourcery:end/ {
    d 
}
}' "$1"
