//
//  Arpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The arpeggiate type indicates that this note is part of an arpeggiated chord.
public struct Arpeggiate {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var number: Int?
    public var direction: UpDown?
    public var placement: AboveBelow?
    public var color: Color?

    // MARK: Attribute Groups

    public var position: Position

    // MARK: - Initializers

    public init(number: Int? = nil, direction: UpDown? = nil, position: Position = Position(), placement: AboveBelow? = nil, color: Color? = nil) {
        self.number = number
        self.direction = direction
        self.position = position
        self.placement = placement
        self.color = color
    }
}

extension Arpeggiate: Equatable {}
extension Arpeggiate: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case number
        case direction
        case placement
        case color
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(direction, forKey: .direction)
        try position.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
        try container.encodeIfPresent(color, forKey: .color)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        direction = try container.decodeIfPresent(UpDown.self, forKey: .direction)
        position = try Position(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}

import XMLCoder
// sourcery:inline:Arpeggiate.DynamicNodeEncoding
extension Arpeggiate: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.number:
            return .attribute
        case CodingKeys.direction:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.color:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
