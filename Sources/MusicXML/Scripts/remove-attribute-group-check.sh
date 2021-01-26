#!/bin/sh
if [[ -z $(gsed -n '/MARK: Attribute Groups/ p' "$1") ]]; then
    gsed -i '
/DynamicNodeEncoding/,$ {
    /XMLAttributeGroupCodingKey/ {
    N
    N
    d
    b
    }
}
' "$1"
fi
