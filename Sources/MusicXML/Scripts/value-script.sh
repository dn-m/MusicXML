#!/bin/sh
if [[ -z $(grep 'MARK: Value' "$1") ]] ; then
    gsed -n -i -r "{
/public (let|var).*value.*/ {
    i\
\ \ \ \ // MARK: Value\n
    s_public let .*value.*_&\n\n\
\ \ \ \ // MARK: Attributes\n_
    p
}
/public (let|var).*value.*/ !{
    p
}}" "$1"
fi
