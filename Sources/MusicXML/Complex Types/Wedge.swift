//
//  Wedge.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The wedge type represents crescendo and diminuendo wedge symbols. The line-type is solid by
/// default.
public struct Wedge {
    // MARK: - Instance Properties

    /// The type attribute is crescendo for the start of a wedge that is closed at the left side,
    /// and diminuendo for the start of a wedge that is closed on the right side.
    public let type: WedgeType
    /// When a number-level value is implied, the value is 1 by default.
    public let number: Int?
    /// Spread values are measured in tenths; those at the start of a crescendo wedge or end of a
    /// diminuendo wedge are ignored.
    public let spread: Tenths?
    /// The niente attribute is yes if a circle appears at the point of the wedge, indicating a
    /// crescendo from nothing or diminuendo to nothing. It is no by default, and used only when the
    /// type is crescendo, or the type is stop for a wedge that began with a diminuendo type.
    public let niente: Bool?
    public let lineType: LineType?
    public let color: Color?

    // MARK: Attribute Groups

    public let dashedFormatting: DashedFormatting
    public let position: Position

    // MARK: - Initializers

    public init(type: WedgeType, number: Int? = nil, spread: Tenths? = nil, niente: Bool? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), position: Position = Position(), color: Color? = nil) {
        self.type = type
        self.number = number
        self.spread = spread
        self.niente = niente
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.position = position
        self.color = color
    }
}

extension Wedge: Equatable {}
extension Wedge: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case number
        case spread
        case niente
        case lineType
        case color
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(spread, forKey: .spread)
        try container.encodeIfPresent(YesNo(niente), forKey: .niente)
        try container.encodeIfPresent(lineType, forKey: .lineType)
        try dashedFormatting.encode(to: encoder)
        try position.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(WedgeType.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        spread = try container.decodeIfPresent(Tenths.self, forKey: .spread)
        niente = try container.decodeIfPresent(Bool.self, forKey: .niente)
        lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        dashedFormatting = try DashedFormatting(from: decoder)
        position = try Position(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
