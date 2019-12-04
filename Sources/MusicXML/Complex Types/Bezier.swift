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
extension Bezier: Codable {}
