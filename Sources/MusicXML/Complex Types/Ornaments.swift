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

    public init(values: [Ornament], accidentalMarks: [AccidentalMark]? = nil) {
        self.values = values
        self.accidentalMarks = accidentalMarks
    }
}

extension Ornaments: Equatable { }
extension Ornaments: Codable {
    enum CodingKeys: String, CodingKey {
        case accidentalMarks = "accidental-mark"
    }
    
    public init(from decoder: Decoder) throws {
        var valuesContainer = try decoder.unkeyedContainer()
        var ornaments = [Ornament]()
        while !valuesContainer.isAtEnd {
            do {
                ornaments.append(try valuesContainer.decode(Ornament.self))
            } catch DecodingError.typeMismatch(let type, _) where type == Ornament.self {
                // Error is caught when we try to read an accidental-mark as an ornament.
                break
            }
        }
        self.values = ornaments
        let elementsContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.accidentalMarks = try elementsContainer.decodeIfPresent([AccidentalMark].self, forKey: .accidentalMarks)
    }
}
