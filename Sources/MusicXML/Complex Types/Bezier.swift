//
//  Bezier.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The bezier attribute group is used to indicate the curvature of slurs and ties, representing the
/// control points for a cubic bezier curve. For ties, the bezier attribute group is used with the
/// tied element. Normal slurs, S-shaped slurs, and ties need only two bezier points: one associated
/// with the start of the slur or tie, the other with the stop. Complex slurs and slurs divided over
/// system breaks can specify additional bezier data at slur elements with a continue type. The
/// bezier-offset, bezier-x, and bezier-y attributes describe the outgoing bezier point for slurs
/// and ties with a start type, and the incoming bezier point for slurs and ties with types of stop
/// or continue. The attributes bezier-offset2, bezier-x2, and bezier-y2 are only valid with slurs
/// of type continue, and describe the outgoing bezier point. The bezier-offset and bezier-offset2
/// attributes are measured in terms of musical divisions, like the offset element. These are the
/// recommended attributes for specifying horizontal position. The other attributes are specified in
/// tenths, relative to any position settings associated with the slur or tied element.
public struct Bezier {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let bezierX: Tenths?
    public let bezierY: Tenths?
    public let bezierX2: Tenths?
    public let bezierY2: Tenths?
    public let bezierOffset: Int?
    public let bezierOffset2: Int?

    // MARK: - Initializers

    public init(bezierX: Tenths? = nil, bezierY: Tenths? = nil, bezierX2: Tenths? = nil, bezierY2: Tenths? = nil, bezierOffset: Int? = nil, bezierOffset2: Int? = nil) {
        self.bezierX = bezierX
        self.bezierY = bezierY
        self.bezierX2 = bezierX2
        self.bezierY2 = bezierY2
        self.bezierOffset = bezierOffset
        self.bezierOffset2 = bezierOffset2
    }
}

extension Bezier: Equatable {}
extension Bezier: Codable {
    // MARK: - Codable

    internal enum CodingKeys: String, CodingKey {
        case bezierX = "bezier-x"
        case bezierY = "bezier-y"
        case bezierX2 = "bezier-x2"
        case bezierY2 = "bezier-y2"
        case bezierOffset = "bezier-offset"
        case bezierOffset2 = "bezier-offset2"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bezierX = try container.decodeIfPresent(Tenths.self, forKey: .bezierX)
        self.bezierY = try container.decodeIfPresent(Tenths.self, forKey: .bezierY)
        self.bezierX2 = try container.decodeIfPresent(Tenths.self, forKey: .bezierX2)
        self.bezierY2 = try container.decodeIfPresent(Tenths.self, forKey: .bezierY2)
        self.bezierOffset = try container.decodeIfPresent(Int.self, forKey: .bezierOffset)
        self.bezierOffset2 = try container.decodeIfPresent(Int.self, forKey: .bezierOffset2)
    }
}

extension Bezier.CodingKeys: XMLAttributeGroupCodingKey {}

import XMLCoder
// sourcery:inline:Bezier.DynamicNodeEncoding
extension Bezier: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.bezierX:
            return .attribute
        case CodingKeys.bezierY:
            return .attribute
        case CodingKeys.bezierX2:
            return .attribute
        case CodingKeys.bezierY2:
            return .attribute
        case CodingKeys.bezierOffset:
            return .attribute
        case CodingKeys.bezierOffset2:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
