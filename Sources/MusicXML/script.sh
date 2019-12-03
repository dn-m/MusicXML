#!/bin/sh
if [[ -z $(grep 'Instance Properties' "$1") ]] ; then
    gsed -i -e '/public struct/ a\
    // MARK: - Instance Properties\n' "$1"
fi

if [[ -z $(grep 'Initializers' "$1") ]] ; then
    gsed -i "/public struct/,/public init(/ {
    s_.*public init.*_\
    // MARK - Initializers\n\
\n\
&_
}" "$1"
fi

if [[ -z $(grep '// MARK: Encodable' "$1") ]] ; then
    gsed -i "/: Codable/,/encode(to encoder/ {
    s_.*encode(to encoder.*_\
    // MARK: Encodable\n\
\n\
&_
}" "$1"
fi

if [[ -z $(grep '// MARK: Decodable' "$1") ]] ; then
    gsed -i "/: Codable/,/init(from decoder/ {
    s_.*init(from decoder.*_\
    // MARK: Decodable\n\
\n\
&_
}" "$1"
fi
