//
//  StartStopContinue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The start-stop-continue type is used for an attribute of musical elements that can either start
/// or stop, but also need to refer to an intermediate point in the symbol, as for complex slurs or
/// for formatting of symbols across system breaks.  The values of start, stop, and continue refer
/// to how an element appears in musical score order, not in MusicXML document order. An element
/// with a stop attribute may precede the corresponding element with a start attribute within a
/// MusicXML document. This is particularly common in multi-staff music. For example, the stopping
/// point for a slur may appear in staff 1 before the starting point for the slur appears in staff 2
/// later in the document.
public enum StartStopContinue: String {
    case start
    case stop
    case `continue`
}

extension StartStopContinue: Equatable { }
extension StartStopContinue: Codable { }
