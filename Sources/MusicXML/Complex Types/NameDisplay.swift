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
    public let printObject: Bool?
    public let texts: [Text]

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

extension NameDisplay.Text: Equatable { }

extension NameDisplay.Text: Codable {
    enum CodingKeys: String, CodingKey {
        case displayText = "display-text"
        case accidentalText = "accidental-text"
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
        if container.contains(.displayText) {
            self = .displayText(try container.decode(FormattedText.self, forKey: .displayText))
        } else if container.contains(.accidentalText) {
            self = .accidentalText(try container.decode(AccidentalText.self, forKey: .accidentalText))
        } else {
            throw DecodingError.typeMismatch(
                NameDisplay.Text.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Cannot decode NameDisplay.Text"
                )
            )
        }
    }
}

extension NameDisplay: Equatable { }
extension NameDisplay: Codable {
    enum CodingKeys: String, CodingKey {
        case printObject = "print-object"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        let textsContainer = try decoder.singleValueContainer()
        self.texts = try textsContainer.decode([Text].self)
    }
}

extension NameDisplay.Text.CodingKeys: XMLChoiceCodingKey { }
