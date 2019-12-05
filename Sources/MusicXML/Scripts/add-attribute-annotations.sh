#!/bin/sh
gsed -i -r '/MARK: Attributes/,/MARK/ {
/MARK: Attributes/ { a\
    // sourcery:begin:attribute
    b
}
/MARK/ { i\
    // sourcery:end
}
}' "$1"
