//
//  Tuplet.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// A tuplet element is present when a tuplet is to be displayed graphically, in addition to the
/// sound data provided by the time-modification elements. The line-shape attribute is used to
/// specify whether the bracket is straight or in the older curved or slurred style. It is straight
/// by default. Whereas a time-modification element shows how the cumulative, sounding effect of
/// tuplets and double-note tremolos compare to the written note type, the tuplet element describes
/// how this is displayed. The tuplet element also provides more detailed representation information
/// than the time-modification element, and is needed to represent nested tuplets and other complex
/// tuplets accurately.
public struct Tuplet {
    // MARK: Attributes

    public var type: StartStop
    /// The number attribute is used to distinguish nested tuplets.
    public var number: Int?
    /// The bracket attribute is used to indicate the presence of a bracket. If unspecified, the
    /// results are implementation-dependent.
    public var bracket: Bool?
    /// The show-number attribute is used to display either the number of actual notes, the number
    /// of both actual and normal notes, or neither. It is actual by default.
    public var showNumber: ShowTuplet?
    /// The show-type attribute is used to display either the actual type, both the actual and
    /// normal types, or neither. It is none by default.
    public var showType: ShowTuplet?
    /// The line-shape attribute distinguishes between straight and curved lines.
    public var lineShape: LineShape?
    public var position: Position?
    public var placement: AboveBelow?

    // MARK: Elements

    public var actualNotes: TupletPortion?
    public var normalNotes: TupletPortion?

    public init(type: StartStop, number: Int? = nil, bracket: Bool? = nil, showNumber: ShowTuplet? = nil, showType: ShowTuplet? = nil, lineShape: LineShape? = nil, position: Position? = nil, placement: AboveBelow? = nil, actualNotes: TupletPortion? = nil, normalNotes: TupletPortion? = nil) {
        self.type = type
        self.number = number
        self.bracket = bracket
        self.showNumber = showNumber
        self.showType = showType
        self.lineShape = lineShape
        self.position = position
        self.placement = placement
        self.actualNotes = actualNotes
        self.normalNotes = normalNotes
    }
}

extension Tuplet: Equatable {}
extension Tuplet: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case number
        case bracket
        case showNumber
        case showType
        case lineShape
        case position
        case placement
        case actualNotes = "actual-notes"
        case normalNotes = "normal-notes"
    }
}
