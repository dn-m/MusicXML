//
//  SMuFL.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

//    The optional-unique-id entity allows an element to optionally
//    specify an ID that is unique to the entire document. This
//    entity is not used for a required id attribute, or for an id
//    attribute that specifies an id reference.
//
// <!ENTITY % optional-unique-id
//    "id ID #IMPLIED">

// > The smufl entity is used to indicate a particular Standard
// > Music Font Layout (SMuFL) character. Sometimes this is a
// > formatting choice, and sometimes this is a refinement of
// > the semantic meaning of an element.
//
// <!ENTITY % smufl
//    "smufl %smufl-glyph-name; #IMPLIED">
public struct SMuFL {
    // MARK: - Instance Properties

    // TODO: Consider nesting Glyph in here.
    public let glyph: SMuFLGlyph

    // MARK: - Initializers

    public init(glyph: SMuFLGlyph) {
        self.glyph = glyph
    }
}

extension SMuFL: Equatable {}
extension SMuFL: Codable {}

import XMLCoder
extension SMuFL: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
