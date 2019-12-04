//
//  NonArpeggiate.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The non-arpeggiate type indicates that this note is at the top or bottom of a bracket indicating
/// to not arpeggiate these notes. Since this does not involve playback, it is only used on the top
/// or bottom notes, not on each note as for the arpeggiate type.
public struct NonArpeggiate {
    // MARK: - Instance Properties

    // MARK: Attributes

    public var type: TopBottom
    public var number: Int?
    public var position: Position
    public var placement: AboveBelow?
    public var color: Color?

    // MARK: - Initializers

    public init(type: TopBottom, number: Int? = nil, position: Position = Position(), placement: AboveBelow? = nil, color: Color? = nil) {
        self.type = type
        self.number = number
        self.position = position
        self.placement = placement
        self.color = color
    }
}

extension NonArpeggiate: Equatable {}
extension NonArpeggiate: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case number
        case placement
        case color
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try position.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
        try container.encodeIfPresent(color, forKey: .color)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TopBottom.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        position = try Position(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
