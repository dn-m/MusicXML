//
//  PrintStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The print-style attribute group collects the most popular combination of printing attributes:
/// position, font, and color.
public struct PrintStyle {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let color: Color?

    // MARK: Attribute Groups

    public let position: Position
    public let font: Font

    // MARK: - Initializers

    public init(position: Position = Position(), font: Font = Font(), color: Color? = nil) {
        self.position = position
        self.font = font
        self.color = color
    }
}

extension PrintStyle: Equatable {}
extension PrintStyle: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case color
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.position = try Position(from: decoder)
        self.font = try Font(from: decoder)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        try position.encode(to: encoder)
        try font.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(color, forKey: .color)
    }
}

extension PrintStyle.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
// sourcery:inline:PrintStyle.DynamicNodeEncoding
extension PrintStyle: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
