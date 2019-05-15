//
//  StartNote.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The start-note type describes the starting note of trills and mordents for playback, relative to
/// the current note.
public enum StartNote: String {
    case upper
    case main
    case below
}

extension StartNote: Equatable { }
extension StartNote: Decodable { }
