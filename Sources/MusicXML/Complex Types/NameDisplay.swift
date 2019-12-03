//
//  NameDisplay.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

import XMLCoder

/// The name-display type is used for exact formatting of multi-font text in part and group names to
/// the left of the system. The print-object attribute can be used to determine what, if anything,
/// is printed at the start of each system. Enclosure for the display-text element is none by
/// default. Language for the display-text element is Italian ("it") by default.
public struct NameDisplay {
    // MARK: - Instance Properties

    public let printObject: Bool?
    public let texts: [Text]

    // MARK - Initializers

    public init(printObject: Bool? = nil, texts: [Text] = []) {
        self.printObject = printObject
        self.texts = texts
    }
}

extension NameDisplay {
    public enum Text {
        case accidentalText(AccidentalText)
        case displayText(FormattedText)
    }
}

extension NameDisplay.Text: Equatable {}

extension NameDisplay.Text: Codable {
    enum CodingKeys: String, CodingKey {
        case displayText = "display-text"
        case accidentalText = "accidental-text"
    }

    // MARK - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .accidentalText(value):
            try container.encode(value, forKey: .accidentalText)
        case let .displayText(value):
            try container.encode(value, forKey: .displayText)
        }
    }

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.accidentalText) {
            self = .accidentalText(try decode(.accidentalText))
        } else if container.contains(.displayText) {
            self = .displayText(try decode(.displayText))
        } else {
            throw DecodingError.typeMismatch(
                NameDisplay.Text.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension NameDisplay: Equatable {}
extension NameDisplay: Codable {
    enum CodingKeys: String, CodingKey {
        case printObject = "print-object"
    }

    // MARK - Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        let textsContainer = try decoder.singleValueContainer()
        self.texts = try textsContainer.decode([Text].self)
    }

    // MARK - Encodable

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO")
    }
}

extension NameDisplay.Text.CodingKeys: XMLChoiceCodingKey {}
