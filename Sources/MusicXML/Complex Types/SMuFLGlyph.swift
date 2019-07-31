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
    public let name: String
}

extension SMuFLGlyph: Equatable { }
extension SMuFLGlyph: Codable { }

