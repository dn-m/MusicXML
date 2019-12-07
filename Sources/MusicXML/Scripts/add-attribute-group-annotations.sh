#!/bin/sh
gsed -i -r '/MARK: Attribute Groups/,/MARK/ {
/MARK: Attribute Groups/ { a\
    // sourcery:begin:attributeGroup
    b
}
/MARK/ { i\
    // sourcery:end
}
}' "$1"
