//
//  TimeSymbol.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The time-symbol type indicates how to display a time signature. The normal value is the usual
/// fractional display, and is the implied symbol type if none is specified. Other options are the
/// common and cut time symbols, as well as a single number with an implied denominator. The note
/// symbol indicates that the beat-type should be represented with the corresponding downstem note
/// rather than a number. The dotted-note symbol indicates that the beat-type should be represented
/// with a dotted downstem note that corresponds to three times the beat-type value, and a numerator
/// that is one third the beats value.
public enum TimeSymbol: String {
    case common = "common"
    case cut = "cut"
    case singleNumber = "single-number"
    case note = "note"
    case dottedNote = "dotted-note"
    case normal = "normal"
}

extension TimeSymbol: Equatable { }
extension TimeSymbol: Decodable { }
