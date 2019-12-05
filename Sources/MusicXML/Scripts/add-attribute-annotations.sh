#!/bin/sh
gsed -r '/MARK: Attributes/,/MARK/ {
/MARK: Attributes/ { a\
    // sourcery:begin:attribute
    b
}
/MARK/ { i\
    // sourcery:end
}
}' "$1"
