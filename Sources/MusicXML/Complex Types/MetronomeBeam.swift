//
//  MetronomeBeam.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The metronome-beam type works like the beam type in defining metric relationships, but does not
/// include all the attributes available in the beam type.
public struct MetronomeBeam {
    public let value: BeamValue
    public let number: BeamLevel?

    public init(value: BeamValue, number: BeamLevel? = nil) {
        self.value = value
        self.number = number
    }
}

extension MetronomeBeam: Equatable { }
extension MetronomeBeam: Codable { }
