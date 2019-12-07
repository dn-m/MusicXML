//
//  HorizontalTurn.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The horizontal-turn type represents turn elements that are horizontal rather than vertical.
/// These are empty elements with print-style, placement, trill-sound, and slash attributes.
public struct HorizontalTurn {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var placement: AboveBelow?
    public var slash: Bool?

    // MARK: Attribute Groups

    public var printStyle: PrintStyle
    public var trillSound: TrillSound

    // MARK: - Initializers

    public init(printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil, trillSound: TrillSound = TrillSound(), slash: Bool? = nil) {
        self.printStyle = printStyle
        self.placement = placement
        self.trillSound = trillSound
        self.slash = slash
    }
}

extension HorizontalTurn: Equatable {}
extension HorizontalTurn: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case placement
        case slash
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        trillSound = try TrillSound(from: decoder)
        slash = try container.decodeIfPresent(Bool.self, forKey: .slash)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
        try trillSound.encode(to: encoder)
        try container.encodeIfPresent(YesNo(slash), forKey: .slash)
    }
}

import XMLCoder
// sourcery:inline:HorizontalTurn.DynamicNodeEncoding
extension HorizontalTurn: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.slash:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
