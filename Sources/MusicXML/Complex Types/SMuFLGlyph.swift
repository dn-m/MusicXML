//
//  SMuFLGlyph.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

// > The smufl-glyph-name entity is used for attributes that
// > reference a specific Standard Music Font Layout (SMuFL)
// > character. The value is a SMuFL canonical glyph name,
// > not a code point. For instance, the value for a standard
// > piano pedal mark would be keyboardPedalPed, not U+E650.
//
// <!ENTITY % smufl-glyph-name "NMTOKEN">
public struct SMuFLGlyph {
    // MARK: - Instance Properties

    public let name: String

    // MARK: - Initializers

    public init(name: String) {
        self.name = name
    }
}

extension SMuFLGlyph: Equatable {}
extension SMuFLGlyph: Codable {}

import XMLCoder
// sourcery:inline:SMuFLGlyph.DynamicNodeEncoding
extension SMuFLGlyph: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
// sourcery:end
