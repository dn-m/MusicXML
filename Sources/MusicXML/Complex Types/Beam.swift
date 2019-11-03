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
    public var value: BeamValue
    public var number: BeamLevel?
    public var repeater: Bool?
    public var fan: Fan?
    public var color: Color?

    public init(_ value: BeamValue, number: BeamLevel? = nil, repeater: Bool? = nil, fan: Fan? = nil, color: Color? = nil) {
        self.value = value
        self.number = number
        self.repeater = repeater
        self.fan = fan
        self.color = color
    }
}

extension Beam: Equatable { }
extension Beam: Codable {
    // sourcery:inline:Beam.ExplicitCodingKey
    enum CodingKeys: String, CodingKey {
        case number
        case repeater
        case fan
        case color
        case value = ""
    }
    // sourcery:end
}
