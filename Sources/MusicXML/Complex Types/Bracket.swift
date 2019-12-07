//
//  Bracket.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

public struct Bracket {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: StartStopContinue
    public let number: Int?
    /// The line-end attribute specifies if there is a jog up or down (or both), an arrow, or
    /// nothing at the start or end of the bracket. If the line-end is up or down, the length of the
    /// jog can be specified using the end-length attribute.
    public let lineEnd: LineEnd
    public let endLength: Tenths?
    public let lineType: LineType?
    public let dashLength: Tenths?
    public let spaceLength: Tenths?
    public let color: Color?

    // MARK: Attribute Groups

    public let position: Position

    // MARK: - Initializers

    public init(type: StartStopContinue, number: Int? = nil, lineEnd: LineEnd, endLength: Tenths? = nil, lineType: LineType? = nil, dashLength: Tenths? = nil, spaceLength: Tenths? = nil, position: Position = Position(), color: Color? = nil) {
        self.type = type
        self.number = number
        self.lineEnd = lineEnd
        self.endLength = endLength
        self.lineType = lineType
        self.dashLength = dashLength
        self.spaceLength = spaceLength
        self.position = position
        self.color = color
    }
}

extension Bracket: Equatable {}
extension Bracket: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case type
        case number
        case lineEnd = "line-end"
        case endLength = "end-length"
        case lineType = "line-type"
        case dashLength = "dash-length"
        case spaceLength = "space-length"
        case color
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StartStopContinue.self, forKey: .type)
        self.lineEnd = try container.decode(LineEnd.self, forKey: .lineEnd)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.endLength = try container.decodeIfPresent(Tenths.self, forKey: .endLength)
        self.lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
        self.dashLength = try container.decodeIfPresent(Tenths.self, forKey: .dashLength)
        self.spaceLength = try container.decodeIfPresent(Tenths.self, forKey: .spaceLength)
        self.position = try Position(from: decoder)
        self.color = try container.decodeIfPresent(Color.self, forKey: .color)
    }
}

import XMLCoder
extension Bracket: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type, CodingKeys.number:
            return .attribute
        case CodingKeys.lineEnd, CodingKeys.endLength, CodingKeys.lineType, CodingKeys.dashLength, CodingKeys.spaceLength, CodingKeys.color:
            return .attribute
        default:
            return .element
        }
    }
}
