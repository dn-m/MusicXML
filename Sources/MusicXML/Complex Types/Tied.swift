//
//  Tied.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The tied type represents the notated tie. The tie element represents the tie sound.
public struct Tied {
    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public var dashedFormatting: DashedFormatting
    public var position: Position
    public var bezier: Bezier

    // MARK: Attributes

    public var type: StartStopContinue
    public var number: Int?
    public var lineType: LineType?
    public var placement: AboveBelow?
    public var orientation: OverUnder?
    public var color: Color?

    // MARK - Initializers

    public init(type: StartStopContinue, number: Int? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), position: Position = Position(), placement: AboveBelow? = nil, orientation: OverUnder? = nil, bezier: Bezier = Bezier(), color: Color? = nil) {
        self.type = type
        self.number = number
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.position = position
        self.placement = placement
        self.orientation = orientation
        self.bezier = bezier
        self.color = color
    }
}

extension Tied: Equatable {}
extension Tied: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case number
        case lineType
        case placement
        case orientation
        case color
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(lineType, forKey: .lineType)
        try dashedFormatting.encode(to: encoder)
        try position.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
        try container.encodeIfPresent(orientation, forKey: .orientation)
        try bezier.encode(to: encoder)
        try container.encodeIfPresent(color, forKey: .color)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(StartStopContinue.self, forKey: .type)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        dashedFormatting = try DashedFormatting(from: decoder)
        position = try Position(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        orientation = try container.decodeIfPresent(OverUnder.self, forKey: .orientation)
        bezier = try Bezier(from: decoder)
        color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}
