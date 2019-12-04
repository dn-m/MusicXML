//
//  TextFontColor.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The text-font-color type represents text with optional font and color information. It is used
/// for the elision element.
public struct TextFontColor {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let color: Color?
    public let textRotation: Double?
    public let letterSpacing: NumberOrNormal?
    public let dir: TextDirection?

    // MARK: Attribute Groups

    public let font: Font
    public let textDecoration: TextDecoration

    // MARK: Value

    public let value: String

    // MARK: - Initializers

    public init(_ value: String, font: Font = Font(), color: Color? = nil, textDecoration: TextDecoration = TextDecoration(), textRotation: Double? = nil, letterSpacing: NumberOrNormal? = nil, dir: TextDirection? = nil) {
        self.value = value
        self.font = font
        self.color = color
        self.textDecoration = textDecoration
        self.textRotation = textRotation
        self.letterSpacing = letterSpacing
        self.dir = dir
    }
}

extension TextFontColor: Equatable {}
extension TextFontColor: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case color
        case textRotation
        case letterSpacing
        case dir
        case value = ""
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
        try textDecoration.encode(to: encoder)
        try container.encodeIfPresent(textRotation, forKey: .textRotation)
        try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
        try container.encodeIfPresent(dir, forKey: .dir)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
        textDecoration = try TextDecoration(from: decoder)
        textRotation = try container.decodeIfPresent(Double.self, forKey: .textRotation)
        letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
        dir = try container.decodeIfPresent(TextDirection.self, forKey: .dir)
    }
}

import XMLCoder
extension TextFontColor: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
