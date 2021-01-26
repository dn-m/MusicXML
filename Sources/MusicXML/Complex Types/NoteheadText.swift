//
//  NoteheadText.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

public struct NoteheadText {
    // MARK: - Instance Properties

    // MARK: Elements

    public let values: [Kind] // NonEmpty

    // MARK: - Initializers

    public init(_ values: [Kind]) {
        self.values = values
    }
}

extension NoteheadText {
    public enum Kind {
        case displayText(FormattedText)
        case accidentalText(AccidentalText)
    }
}

extension NoteheadText.Kind: Equatable {}
extension NoteheadText.Kind: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case displayText
        case accidentalText
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .displayText(value):
            try container.encode(value, forKey: .displayText)
        case let .accidentalText(value):
            try container.encode(value, forKey: .accidentalText)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.displayText) {
            self = .displayText(try decode(.displayText))
        } else if container.contains(.accidentalText) {
            self = .accidentalText(try decode(.accidentalText))
        } else {
            throw DecodingError.typeMismatch(
                NoteheadText.Kind.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension NoteheadText.Kind.CodingKeys: XMLChoiceCodingKey {}

extension NoteheadText: Equatable {}
extension NoteheadText: Codable {}

extension NoteheadText: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
