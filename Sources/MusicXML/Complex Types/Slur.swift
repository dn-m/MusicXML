//
//  Slur.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Slur types are empty. Most slurs are represented with two elements: one with a start type, and
/// one with a stop type. Slurs can add more elements using a continue type. This is typically used
/// to specify the formatting of cross-system slurs, or to specify the shape of very complex slurs.
public struct Slur {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let color: Color?
    public let type: StartStopContinue
    public let number: Int?
    public let lineType: LineType?
    public let placement: AboveBelow?
    public let orientation: OverUnder?

    // MARK: Attribute Groups

    public let bezier: Bezier
    public let dashedFormatting: DashedFormatting
    public let position: Position

    // MARK: - Initializers

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

extension Slur: Equatable {}
extension Slur: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case type
        case number
        case lineType
        case placement
        case orientation
        case color
    }

    // MARK: Encodable

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

    // MARK: Decodable

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

import XMLCoder
extension Slur: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.color:
            return .attribute
        case CodingKeys.type:
            return .attribute
        case CodingKeys.number:
            return .attribute
        case CodingKeys.lineType:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.orientation:
            return .attribute
        default:
        return .element
        }
    }
}
