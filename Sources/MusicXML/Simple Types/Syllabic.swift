//
//  Syllabic.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// Lyric hyphenation is indicated by the syllabic type. The single, begin, end, and middle values
/// represent single-syllable words, word-beginning syllables, word-ending syllables, and mid-word
/// syllables, respectively.
public enum Syllabic: String {
    case single
    case begin
    case end
    case middle
}

extension Syllabic: Equatable { }
extension Syllabic: Codable { }
