//
//  Rest.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//


/// The rest element indicates notated rests or silences. Rest elements are usually empty, but
/// placement on the staff can be specified using display-step and display-octave elements.
public struct Rest {
    public let displayStep: Int?
    public let displayOctave: Int?
    public let measure: Bool
}

extension Rest: Equatable { }
extension Rest: Decodable { }
