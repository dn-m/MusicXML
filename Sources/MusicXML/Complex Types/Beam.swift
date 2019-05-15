//
//  Beam.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// Beam values include begin, continue, end, forward hook, and backward hook. Up to eight
/// concurrent beams are available to cover up to 1024th notes. Each beam in a note is represented
/// with a separate beam element, starting with the eighth note beam using a number attribute of 1.
/// Note that the beam number does not distinguish sets of beams that overlap, as it does for slur
/// and other elements. Beaming groups are distinguished by being in different voices and/or the
/// presence or absence of grace and cue elements.
public struct Beam {
    public let value: BeamValue
    public let number: BeamLevel?
    public let repeater: Bool?
    public let fan: Fan?
    public let color: Color?
}

extension Beam: Equatable { }
extension Beam: Decodable { }
