//
//  TextElementData.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The text-element-data type represents a syllable or portion of a syllable for lyric text
/// underlay. A hyphen in the string content should only be used for an actual hyphenated word.
/// Language names for text elements come from ISO 639, with optional country subcodes from ISO
/// 3166.
public struct TextElementData {
    // MARK: - Instance Properties

    // MARK: Value

    public let value: String

    // MARK: Attribute Groups

    public let font: Font
    public let textDecoration: TextDecoration

    // MARK: Attributes

    public let color: Color?
    public let textRotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let direction: TextDirection?

    // MARK - Initializers

    public init(
        _ value: String,
        font: Font = Font(),
        color: Color? = nil,
        textDecoration: TextDecoration = TextDecoration(),
        textRotation: Double? = nil,
        letterSpacing: NumberOrNormal? = nil,
        direction: TextDirection? = nil
    ) {
        self.value = value
        self.font = font
        self.color = color
        self.textDecoration = textDecoration
        self.textRotation = textRotation
        self.letterSpacing = letterSpacing
        self.direction = direction
    }
}

extension TextElementData: Equatable {}
extension TextElementData: Codable {
    enum CodingKeys: String, CodingKey {
        case color
        case textRotation
        case letterSpacing
        case direction
        case value = ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try font.encode(to: encoder)
        try textDecoration.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(textRotation, forKey: .textRotation)
        try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
        try container.encodeIfPresent(direction, forKey: .direction)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        font = try Font(from: decoder)
        textDecoration = try TextDecoration(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
        textRotation = try container.decodeIfPresent(Double.self, forKey: .textRotation)
        letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
        direction = try container.decodeIfPresent(TextDirection.self, forKey: .direction)
    }
}

extension TextElementData: ExpressibleByStringLiteral {
    // MARK: - ExpressibleByStringLiteral

    public init(stringLiteral value: String) {
        self.init(value)
    }
}

import XMLCoder
extension TextElementData: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
