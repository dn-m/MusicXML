//
//  LineWidthType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-width-type defines what type of line is being defined in a line-width element. Values
/// include beam, bracket, dashes, enclosure, ending, extend, heavy barline, leger, light barline,
/// octave shift, pedal, slur middle, slur tip, staff, stem, tie middle, tie tip, tuplet bracket,
/// and wedge. This is left as a string so that other application-specific types can be defined, but
/// it is made a separate type so that it can be redefined more strictly.
public enum LineWidthType: String {
    case beam
    case bracket
    case dashes
    case enclosure
    case ending
    case extend
    case heavyBarline = "heavy barline"
    case leger
    case lightBarline = "light barline"
    case octaveShift = "octave shift"
    case pedal
    case slurMiddle = "slur middle"
    case slurTip = "slur tip"
    case staff
    case stem
    case tieMiddle = "tie middle"
    case tieTip = "tie tip"
    case tupletBracket = "tuplet bracket"
    case wedge
}

extension LineWidthType: Equatable { }
extension LineWidthType: Codable { }
