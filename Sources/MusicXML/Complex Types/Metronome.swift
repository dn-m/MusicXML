//
//  Metronome.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The metronome type represents metronome marks and other metric relationships. The beat-unit
/// group and per-minute element specify regular metronome marks. The metronome-note and
/// metronome-relation elements allow for the specification of more complicated metric
/// relationships, such as swing tempo marks where two eighths are equated to a quarter note /
/// eighth note triplet.
public struct Metronome {
    public let printStyleAlign: PrintStyleAlign?
    public let justify: Justify?
    public let parentheses: Bool?
    #warning("TODO: Flesh out Metronome Content Model")
}

extension Metronome: Equatable { }
extension Metronome: Decodable { }
