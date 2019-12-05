#!/bin/sh
gsed -i -r '/sourcery:begin:attribute/,/sourcery:end/ {
/sourcery:begin:attribute/ {
    d
}
/sourcery:end/ {
    d 
}
}' "$1"
