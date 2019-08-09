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

    // MARK: - Elements

    public var values: [Ornament]
    public var accidentalMarks: [AccidentalMark]?
}

extension Ornaments: Equatable { }
extension Ornaments: Codable {
    enum CodingKeys: String, CodingKey {
        case values
        case accidentalMarks = "accidental-mark"
    }
    public init(from decoder: Decoder) throws {
        let valuesContainer = try decoder.singleValueContainer()
        self.values = try valuesContainer.decode([Ornament].self)
        let elementsContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.accidentalMarks = try elementsContainer.decodeIfPresent([AccidentalMark].self, forKey: .accidentalMarks)
    }
}
