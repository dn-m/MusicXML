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

    public let font: Font?
    public let textDecoration: TextDecoration?

    // MARK: One-off Attributes

    public let color: Color?
    public let textRotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let direction: TextDirection?

    public init(
        _ value: String,
        font: Font? = nil,
        color: Color? = nil,
        textDecoration: TextDecoration? = nil,
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

extension TextElementData: Equatable { }
extension TextElementData: Codable {
    // sourcery:inline:TextElementData.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case font
        case textDecoration
        case color
        case textRotation
        case letterSpacing
        case direction
        case value = ""
    }
    // sourcery:end
}

extension TextElementData: ExpressibleByStringLiteral {

    // MARK: - ExpressibleByStringLiteral

    public init(stringLiteral value: String) {
        self.init(value)
    }
}
