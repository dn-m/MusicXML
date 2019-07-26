//
//  Ornaments.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Ornaments can be any of several types, followed optionally by accidentals. The accidental-mark
/// element's content is represented the same as an accidental element, but with a different name to
/// reflect the different musical meaning.
public struct Ornaments {
    public let values: [Ornament]
    public let accidentalMark: AccidentalMark?
}

extension Ornaments: Equatable { }
extension Ornaments: Codable { }
