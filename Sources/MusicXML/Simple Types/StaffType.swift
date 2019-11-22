//
//  StaffType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The staff-type value can be ossia, cue, editorial, regular, or alternate. An alternate staff
/// indicates one that shares the same musical data as the prior staff, but displayed differently
/// (e.g., treble and bass clef, standard notation and tab).
public enum StaffType: String {
    case ossia
    case cue
    case editorial
    case regular
    case alternate
}

extension StaffType: Equatable {}
extension StaffType: Codable {}
