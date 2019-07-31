//
//  Membrane.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The membrane type represents pictograms for membrane percussion instruments. The goblet drum
/// value is in addition to Stone's list.
public enum Membrane: String {
    case bassDrum = "bass drum"
    case bassDrumOnSide = "bass drum on side"
    case bongos
    case congaDrum = "conga drum"
    case gobletDrum = "goblet drum"
    case militaryDrum = "military drum"
    case snareDrum = "snare drum"
    case snareDrumSnaresOff = "snare drum snares off"
    case tambourine
    case tenorDrum = "tenor drum"
    case timbales
    case tomtom
}

extension Membrane: Equatable { }
extension Membrane: Codable { }
