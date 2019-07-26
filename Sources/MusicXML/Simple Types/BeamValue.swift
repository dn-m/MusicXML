//
//  BeamValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The beam-value type represents the type of beam associated with each of 8 beam levels (up to
/// 1024th notes) available for each note.
public enum BeamValue: String {
    case begin
    case `continue`
    case end
    case forwardHook = "foreward hook"
    case backwardHook = "backward hook"
}

extension BeamValue: Equatable { }
extension BeamValue: Codable { }
