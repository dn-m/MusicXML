//
//  Notations.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Notations refer to musical notations, not XML notations. Multiple notations are allowed in order
/// to represent multiple editorial levels. The print-object attribute, added in Version 3.0, allows
/// notations to represent details of performance technique, such as fingerings, without having them
/// appear in the score.
public struct Notations {
    public let printObject: Bool?
    public let footnote: FormattedText?
    public let level: Level?
    public let values: [Notation]
}

extension Notations {
    public enum Notation {
        case tied(Tied)
        case slur(Slur)
        case tuplet(Tuplet)
        case glissando(Glissando)
        case slide(Slide)
        case ornaments(Ornaments)
        case technical(Technical)
        case articulations(Articulations)
        case dynamics(Dynamics)
        case fermata(Fermata)
        case arpeggiate(Arpeggiate)
        case nonArpeggiate(NonArpeggiate)
        case accidentalMark(AccidentalMark)
        case other(OtherNotation)
    }
}

extension Notations.Notation: Equatable { }
extension Notations.Notation: Decodable {
    #warning("TODO: Implement Notations.Notation: Decodable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Notations.Notation.init(from: Decoder) not yet implemented!")
    }
}

extension Notations: Equatable { }
extension Notations: Decodable { }
