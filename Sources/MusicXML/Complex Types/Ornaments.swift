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
    // MARK: - Instance Properties

    // MARK: Elements

    public var values: [Ornament]
    public var accidentalMarks: [AccidentalMark]

    // MARK: - Initializers

    public init(_ values: [Ornament] = [], accidentalMarks: [AccidentalMark] = []) {
        self.values = values
        self.accidentalMarks = accidentalMarks
    }
}

extension Ornaments: Equatable {}
extension Ornaments: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case accidentalMarks = "accidental-mark"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        do {
            self.values = try decoder.collectArray()
            let elementsContainer = try decoder.container(keyedBy: CodingKeys.self)
            self.accidentalMarks = try elementsContainer.decode([AccidentalMark].self, forKey: .accidentalMarks)
        } catch {
            self.values = []
            self.accidentalMarks = []
        }
    }
}
