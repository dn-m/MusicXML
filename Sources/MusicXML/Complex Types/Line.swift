//
//  Line.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-line type represents an empty element with line-shape, line-type, dashed-formatting,
/// print-style and placement attributes.
public struct Line {
    // MARK: - Instance Properties

    public var lineShape: LineShape?
    public var lineType: LineType?
    public var placement: AboveBelow?

    // MARK: Attribute Groups

    public var dashedFormatting: DashedFormatting
    public var position: Position
    public var printStyle: PrintStyle

    // MARK: - Initializers

    public init(lineShape: LineShape? = nil, lineType: LineType? = nil, dashedFormatting: DashedFormatting = DashedFormatting(), position: Position = Position(), printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.lineShape = lineShape
        self.lineType = lineType
        self.dashedFormatting = dashedFormatting
        self.position = position
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Line: Equatable {}
extension Line: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case lineShape
        case lineType
        case placement
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lineShape, forKey: .lineShape)
        try container.encodeIfPresent(lineType, forKey: .lineType)
        try dashedFormatting.encode(to: encoder)
        try position.encode(to: encoder)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lineShape = try container.decodeIfPresent(LineShape.self, forKey: .lineShape)
        lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        dashedFormatting = try DashedFormatting(from: decoder)
        position = try Position(from: decoder)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }
}
