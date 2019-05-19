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
    public let type: StartStop
    /// The number attribute is used to distinguish nested tuplets.
    public let number: NumberLevel?
    /// The bracket attribute is used to indicate the presence of a bracket. If unspecified, the
    /// results are implementation-dependent.
    public let bracket: Bool?
    /// The show-number attribute is used to display either the number of actual notes, the number
    /// of both actual and normal notes, or neither. It is actual by default.
    public let showNumber: ShowTuplet?
    /// The show-type attribute is used to display either the actual type, both the actual and
    /// normal types, or neither. It is none by default.
    public let showType: ShowTuplet?
    /// The line-shape attribute distinguishes between straight and curved lines.
    public let lineShape: LineShape?
    public let position: Position?
    public let placement: AboveBelow?
    public let actual: TupletPortion?
    public let normal: TupletPortion?
}

extension Tuplet: Equatable { }
extension Tuplet: Decodable { }
