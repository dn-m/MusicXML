//
//  Mode.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The mode type is used to specify major/minor and other mode distinctions. Valid mode values
/// include major, minor, dorian, phrygian, lydian, mixolydian, aeolian, ionian, locrian, and none.
public enum Mode: String {
    case major
    case minor
    case dorian
    case phrygian
    case lydian
    case mixolydian
    case aeolian
    case ionian
    case locrian
    case none
}

extension Mode: Equatable { }
extension Mode: Codable { }
