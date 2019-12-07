#!/bin/sh

gsed -r -n '/DynamicNodeEncoding/,/^\}/ {
/case/ {
p
}
}' "$1"
