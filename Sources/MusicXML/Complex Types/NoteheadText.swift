//
//  NoteheadText.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public struct NoteheadText {
    public enum Kind {
        case displayText(FormattedText)
        case accidentalText(AccidentalText)
    }
    public let values: [Kind] // NonEmpty

    public init(values: [Kind]) {
        self.values = values
    }
}

extension NoteheadText.Kind: Equatable { }
extension NoteheadText.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case displayText
        case accidentalText
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .displayText(value):
            try container.encode(value, forKey: .displayText)
        case let .accidentalText(value):
            try container.encode(value, forKey: .accidentalText)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .displayText(try container.decode(FormattedText.self, forKey: .displayText))
        } catch {
            self = .accidentalText(try container.decode(AccidentalText.self, forKey: .accidentalText))
        }
    }
}

extension NoteheadText.Kind.CodingKeys: XMLChoiceCodingKey { }

extension NoteheadText: Equatable { }
extension NoteheadText: Codable { }
