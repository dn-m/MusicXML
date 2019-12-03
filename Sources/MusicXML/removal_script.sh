#!/bin/sh
if [[ -n $(grep 'sourcery:inline."AutoEncodable' "$1") ]] ; then
    gsed -i -r '\_sourcery:inline.*AutoEncodable_,\_// sourcery:end_ {
    d/ sourcery/
}' "$1"
fi
