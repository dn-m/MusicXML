//
//  WavyLine.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Wavy lines are one way to indicate trills. When used with a measure element, they should always
/// have type="continue" set.
public struct WavyLine {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopContinue
    public let number: Int?
    public let placement: AboveBelow?
    public let color: Color?

    // MARK: Attribute Groups

    public let position: Position
    public let trillSound: TrillSound

    // MARK: - Initializers

    public init(type: StartStopContinue, number: Int? = nil, position: Position = Position(), placement: AboveBelow? = nil, color: Color? = nil, trillSound: TrillSound = TrillSound()) {
        self.type = type
        self.number = number
        self.position = position
        self.placement = placement
        self.color = color
        self.trillSound = trillSound
    }
}

extension WavyLine: Equatable {}
extension WavyLine: Codable {
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
        try trillSound.encode(to: encoder)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(StartStopContinue.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        position = try Position(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
        trillSound = try TrillSound(from: decoder)
    }
}
