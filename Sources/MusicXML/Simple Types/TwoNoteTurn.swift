//
//  TwoNoteTurn.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The two-note-turn type describes the ending notes of trills and mordents for playback, relative
/// to the current note.
public enum TwoNoteTurn: String {
    case whole
    case half
    case none
}

extension TwoNoteTurn: Equatable {}
extension TwoNoteTurn: Codable {}
