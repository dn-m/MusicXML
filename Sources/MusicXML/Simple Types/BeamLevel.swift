//
//  BeamLevel.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The MusicXML format supports eight levels of beaming, up to 1024th notes. Unlike the
/// `number-level` attribute, the beam-level attribute identifies concurrent beams in a beam group.
/// It does not distinguish overlapping beams such as grace notes within regular notes, or beams
/// used in different voices.
public enum BeamLevel: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
}

extension BeamLevel: Equatable { }
extension BeamLevel: Decodable { }
