//
//  TupletDot.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tuplet-dot type is used to specify dotted normal tuplet types.
public struct TupletDot {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let color: Color?

    // MARK: Attribute Groups

    public let font: Font

    // MARK: - Initializers

    public init(font: Font = Font(), color: Color? = nil) {
        self.font = font
        self.color = color
    }
}

extension TupletDot: Equatable {}
extension TupletDot: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case color
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try font.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        font = try Font(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}

import XMLCoder
// sourcery:inline:TupletDot.DynamicNodeEncoding
extension TupletDot: DynamicNodeEncoding {
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
