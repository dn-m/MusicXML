//
//  StartStop.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The start-stop type is used for an attribute of musical elements that can either start or stop,
/// such as tuplets.  The values of start and stop refer to how an element appears in musical score
/// order, not in MusicXML document order. An element with a stop attribute may precede the
/// corresponding element with a start attribute within a MusicXML document. This is particularly
/// common in multi-staff music. For example, the stopping point for a tuplet may appear in staff 1
/// before the starting point for the tuplet appears in staff 2 later in the document.
public enum StartStop: String {
    case start
    case stop
}

extension StartStop: Equatable {}
extension StartStop: Codable {}
