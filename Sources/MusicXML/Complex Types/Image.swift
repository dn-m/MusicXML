//
//  Image.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The image type is used to include graphical images in a score.
public struct Image {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let source: String
    public let type: String
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlignImage?

    // MARK: Attribute Groups

    public let position: Position

    // MARK: - Initializers

    public init(source: String, type: String, position: Position = Position(), hAlign: LeftCenterRight? = nil, vAlign: VAlignImage? = nil) {
        self.source = source
        self.type = type
        self.position = position
        self.hAlign = hAlign
        self.vAlign = vAlign
    }
}

extension Image: Equatable {}
extension Image: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case source
        case type
        case hAlign
        case vAlign
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(type, forKey: .type)
        try position.encode(to: encoder)
        try container.encodeIfPresent(hAlign, forKey: .hAlign)
        try container.encodeIfPresent(vAlign, forKey: .vAlign)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(String.self, forKey: .source)
        type = try container.decode(String.self, forKey: .type)
        position = try Position(from: decoder)
        hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
        vAlign = try container.decodeIfPresent(VAlignImage.self, forKey: .vAlign)
    }
}

import XMLCoder
// sourcery:inline:Image.DynamicNodeEncoding
extension Image: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.source:
            return .attribute
        case CodingKeys.type:
            return .attribute
        case CodingKeys.hAlign:
            return .attribute
        case CodingKeys.vAlign:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
