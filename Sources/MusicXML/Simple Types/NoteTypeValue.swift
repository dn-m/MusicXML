//
//  NoteTypeValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The note-type type is used for the MusicXML type element and represents the graphic note type,
/// from 1024th (shortest) to maxima (longest).
public enum NoteTypeValue: String {
    case maxima
    case long
    case breve
    case whole
    case half
    case quarter
    case eighth
    case sixteenth = "16th"
    case thirysecond = "32nd"
    case sixtyfourth = "64th"
    case onehundredtwentyeighth = "128th"
    case twohundredfiftysixth = "256th"
    case fivehundredtwelfth = "512th"
    case onethousandtwentyfourth = "1024th"
}

extension NoteTypeValue: Equatable { }
extension NoteTypeValue: Codable { }
