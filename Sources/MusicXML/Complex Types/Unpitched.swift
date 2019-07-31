//
//  Unpitched.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The unpitched type represents musical elements that are notated on the staff but lack definite
/// pitch, such as unpitched percussion and speaking voice.
public struct Unpitched {
    public let displayStep: Step?
    public let displayOctave: Int?
}

extension Unpitched: Equatable { }
extension Unpitched: Codable { }
